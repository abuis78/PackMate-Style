# PackMate Style Guide

Verbindliche Design- und Code-Grundlage für alle PackMate-1.0-Module.  
Stack: Flutter · Supabase · Ziel-Plattformen iOS / macOS / Android.

## Inhalt

| Dokument | Inhalt |
|---|---|
| [`docs/BRANDING.md`](docs/BRANDING.md) | Farbpalette, Typografie, Logo-Richtlinien, App-Icon |
| [`docs/UI_COMPONENTS.md`](docs/UI_COMPONENTS.md) | Button, Card, Input, AppBar, BottomNav — Regeln & Beispiele |
| [`docs/CODE_STYLE.md`](docs/CODE_STYLE.md) | Dart/Flutter-Konventionen, Widget-Struktur, Ordnerstruktur |
| [`tokens/packmate_tokens.dart`](tokens/packmate_tokens.dart) | Dart-Konstanten (Farben, Spacing, Typografie) — Source of Truth |

## Anwendung

Die Datei `tokens/packmate_tokens.dart` wird 1:1 nach
`packages/packmate_kernel/lib/src/tokens/packmate_tokens.dart` übernommen.
Alle `app_*`-Module importieren Tokens **ausschließlich** aus `packmate_kernel` —
niemals aus einem anderen `app_*`-Modul (Contract G1).

## Invariante

> Design-Tokens sind Daten, keine Widgets.  
> `packmate_kernel` stellt die Tokens bereit. Wie sie gerendert werden,
> entscheidet jedes Modul eigenständig.
