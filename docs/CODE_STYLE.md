# PackMate — Code Style (Dart / Flutter)

---

## Datei- & Ordnerstruktur innerhalb eines `app_*`-Moduls

```
app_owner/
  lib/
    app_owner.dart          ← öffentlicher Einstiegspunkt (nur Widget-Export)
    src/
      screens/              ← je Screen eine Datei: dog_list_screen.dart
      widgets/              ← wiederverwendbare Widgets NUR in diesem Modul
      view_models/          ← StateNotifier / ChangeNotifier / Cubit je Screen
      models/               ← lokale DTOs / View-Models (nicht Gateway-DTOs)
```

Regeln:
- `lib/app_owner.dart` exportiert **nur** das Root-Widget (`OwnerApp`).
- Screens sind **nicht** direkt importierbar von außen.
- Gateway-Aufrufe **ausschließlich** in `view_models/` — nie in Widgets.
- Jede Datei hat genau eine öffentliche Klasse / Funktion.

---

## Namenskonventionen

| Typ | Konvention | Beispiel |
|---|---|---|
| Datei | `snake_case.dart` | `dog_list_screen.dart` |
| Klasse / Widget | `UpperCamelCase` | `DogListScreen` |
| Variable / Funktion | `lowerCamelCase` | `onDogTap` |
| Konstante (Compile-time) | `lowerCamelCase` | `PackColors.packBlue` |
| Private | `_lowerCamelCase` | `_loadDogs()` |
| Gateway-RPC-Wrapper | Verb + Nomen | `ownerHomeLoad()` |

---

## Widget-Struktur

```dart
// ── Öffentliches Widget ──────────────────────────────────────────────────────

class DogListScreen extends StatelessWidget {
  const DogListScreen({super.key, required this.gateway});
  final GatewayClient gateway;

  @override
  Widget build(BuildContext context) => _DogListView(gateway: gateway);
}

// ── Private Implementierung ──────────────────────────────────────────────────

class _DogListView extends StatefulWidget { ... }
class _DogListViewState extends State<_DogListView> { ... }
```

Regeln:
- Öffentliche Widgets sind immer `const`-fähig (alle Felder `final`).
- `build()` delegiert bei komplexen Screens sofort an ein privates Widget.
- Kein Business-Logik-Code in `build()` — nur Rendering.
- `setState` nur für UI-Zustand (Loading-Flag, Form-State) — nie für Business-Daten.

---

## State Management

Phase 1–6: **keine externe State-Management-Lib** (kein Riverpod, kein Bloc).  
Erlaubt: `StatefulWidget` + `setState`, `ValueNotifier`, `FutureBuilder`, `StreamBuilder`.  
Begründung: Scope ist klein, Contract verbietet sowieso rollenübergreifenden Zustand.

Ab Phase 7 (Feature-Ausbau): Entscheidung pro Modul, kein globaler Store.

---

## Gateway-Aufrufe

```dart
// ✅ Richtig — in _ViewModelState oder initState
Future<void> _load() async {
  setState(() => _loading = true);
  try {
    _data = await widget.gateway.ownerHomeLoad();
  } on Exception catch (e) {
    _error = e.toString();
  } finally {
    if (mounted) setState(() => _loading = false);
  }
}

// ❌ Falsch — direkt in build() oder im Widget-Konstruktor
```

---

## Tokens importieren

```dart
// ✅ Richtig
import 'package:packmate_kernel/packmate_kernel.dart';

final color = PackColors.packBlue;
final spacing = PackSpacing.lg;

// ❌ Falsch — Hex direkt oder Magic Number
const color = Color(0xFF2B6CB0);
const padding = EdgeInsets.all(16);
```

---

## Kommentare

- **Kein** Kommentar wenn der Code selbsterklärend ist.
- Kommentar nur für: nicht-offensichtliche Constraints, Workarounds, Contract-Verweise.
- Keine `// TODO`-Kommentare im Commit — als GitHub-Issue anlegen.
- Kein auskommentierter Code in Commits.

---

## Verbotene Patterns

| Pattern | Grund |
|---|---|
| `app_*` importiert anderes `app_*` | Contract G1 — Import-Boundary |
| Direkter Tabellenzugriff via Supabase-Client | Contract G2 — Gateway-Pflicht |
| `if (role == 'school')` in geteiltem Code | Contract O2 — Rolle nur im Bootstrapper |
| `dart:io` direkt in Widgets | Plattform-Abstraktion via packmate_kernel |
| Hardcodierte Strings in der UI | i18n-Vorbereitung — Strings als Konstanten |

---

## Analyse-Konfiguration

`analysis_options.yaml` im Root gilt für alle Packages.  
Kein `// ignore:` ohne Kommentar warum.  
`flutter analyze` muss vor jedem Commit grün sein (Pre-push-Hook erzwingt es).
