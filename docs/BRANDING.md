# PackMate — Branding & Visual Identity

## Charakter

PackMate ist die Verbindungsschicht zwischen Hunden, ihren Besitzern, Schulen und Walkern.  
Ton: **warm, verlässlich, professionell — nie steril**.

---

## Farbpalette

### Primärfarben

| Name | Hex | Verwendung |
|---|---|---|
| `packBlue` | `#2B6CB0` | Primary-Actions, AppBar, aktive NavItems |
| `packBlueDark` | `#1A4A7A` | Hover / Pressed-State auf `packBlue` |
| `packBlueLight` | `#EBF4FF` | Hintergründe, Chips, Tags |

### Akzentfarben

| Name | Hex | Verwendung |
|---|---|---|
| `packAmber` | `#D97706` | CTAs, Badges, Highlights |
| `packAmberLight` | `#FEF3C7` | Amber-Hintergründe |
| `packGreen` | `#2D9B5A` | Erfolg, aktive Connections, Online-Status |
| `packGreenLight` | `#D1FAE5` | Erfolgs-Hintergründe |
| `packRed` | `#DC2626` | Fehler, Warnungen, Revoked-Connections |
| `packRedLight` | `#FEE2E2` | Fehler-Hintergründe |

### Neutrale

| Name | Hex | Verwendung |
|---|---|---|
| `packGray900` | `#111827` | Primärer Text |
| `packGray700` | `#374151` | Sekundärer Text |
| `packGray500` | `#6B7280` | Placeholder, Disabled |
| `packGray300` | `#D1D5DB` | Trennlinien, Borders |
| `packGray100` | `#F3F4F6` | Karten-Hintergründe |
| `packWhite` | `#FFFFFF` | Basis-Hintergrund |

### Rollen-Farben (Akzente je Modul)

| Rolle | Akzentfarbe | Hex |
|---|---|---|
| Hundeschule | `schoolTeal` | `#0D7377` |
| Walker | `walkerOrange` | `#C05621` |
| Hundebesitzer | `ownerPurple` | `#6B46C1` |

Rollen-Farben werden **nur** innerhalb des jeweiligen `app_*`-Moduls als lokale
Konstanten definiert — **nicht** im `packmate_kernel`.

---

## Typografie

PackMate verwendet **System-Fonts** (SF Pro auf iOS/macOS, Roboto auf Android).
Keine Custom-Fonts in Phase 1–6.

| Stil | Größe | Weight | Einsatz |
|---|---|---|---|
| `displayLarge` | 32 sp | Bold (700) | Onboarding-Titel, Splash |
| `headlineMedium` | 24 sp | SemiBold (600) | Screen-Titel, Section-Header |
| `titleLarge` | 20 sp | SemiBold (600) | Card-Titel, Dialog-Titel |
| `bodyLarge` | 16 sp | Regular (400) | Fließtext, Listen-Items |
| `bodyMedium` | 14 sp | Regular (400) | Sekundärtext, Labels |
| `labelSmall` | 11 sp | Medium (500) | Badges, Tags, Chips |

---

## Logo-Richtlinien

**Konzept:** Pfote + Verbindungspunkt (symbolisiert die drei Rollen, die zusammenkommen).

- Primärlogo: Wortmarke "PackMate" + Pfoten-Icon links
- Icon-only: Pfoten-Silhouette (für App-Icon, Favicon)
- Farben: `packBlue` auf Weiß (Hell-Mode), Weiß auf `packBlue` (Dunkel-Modus / Splash)
- Mindestgröße: 24 × 24 pt (Icon), 80 pt Breite (Wortmarke)
- Schutzzone: rundum mind. 8 pt Abstand zu anderen Elementen

## App-Icon

| Plattform | Größe | Stil |
|---|---|---|
| iOS | 1024 × 1024 px | Pfoten-Icon, `packBlue` Hintergrund, weiße Pfote, kein Alpha-Kanal |
| macOS | 1024 × 1024 px | Identisch iOS, abgerundete Ecken werden vom System gesetzt |
| Android | 108 × 108 dp | Adaptive Icon: Foreground weiße Pfote, Background `packBlue` |

---

## Dunkel-Modus

PackMate unterstützt Dark Mode ab Phase 7.  
Bis dahin: `ThemeMode.light` fest kodiert — **keine** `dark`-Branches im Code.
