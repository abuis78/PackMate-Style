# PackMate — UI-Komponenten-Regeln

Jede Regel gilt für alle drei `app_*`-Module. Tokens aus `packmate_kernel` importieren,
niemals Hex-Werte hart kodieren.

---

## Buttons

### FilledButton (Primary)
- Hintergrund: `PackColors.packBlue`
- Text: Weiß, `labelLarge`, SemiBold
- Radius: `PackRadius.md` (12 px)
- Padding: `PackSpacing.md` vertikal, `PackSpacing.xl` horizontal
- Pressed: Hintergrund `packBlueDark`
- Disabled: Opacity 0.4

```dart
FilledButton(
  style: FilledButton.styleFrom(
    backgroundColor: PackColors.packBlue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PackRadius.md)),
    padding: const EdgeInsets.symmetric(
      vertical: PackSpacing.md,
      horizontal: PackSpacing.xl,
    ),
  ),
  onPressed: onPressed,
  child: Text(label),
)
```

### OutlinedButton (Secondary)
- Border: `packBlue`, 1.5 px
- Text: `packBlue`
- Gleicher Radius/Padding wie FilledButton

### TextButton (Tertiary / Destruktiv)
- Normale Aktionen: `packBlue`
- Destruktive Aktionen (Löschen, Widerrufen): `packRed`
- Kein Hintergrund, kein Border

---

## Cards

- Hintergrund: `packWhite`
- Border-Radius: `PackRadius.lg` (16 px)
- Elevation: 0 (kein Schatten) — stattdessen Border `packGray300`, 1 px
- Padding: `PackSpacing.lg` (16 px) rundum
- Klickbare Cards: `InkWell` mit `borderRadius: PackRadius.lg`

```dart
Container(
  decoration: BoxDecoration(
    color: PackColors.packWhite,
    borderRadius: BorderRadius.circular(PackRadius.lg),
    border: Border.all(color: PackColors.packGray300),
  ),
  padding: const EdgeInsets.all(PackSpacing.lg),
  child: child,
)
```

---

## TextFields / Inputs

- Stil: `OutlineInputBorder`
- Border-Radius: `PackRadius.md` (12 px)
- Normale Border: `packGray300`
- Fokus-Border: `packBlue`, 2 px
- Fehler-Border: `packRed`
- Label: `bodyMedium`, `packGray700`
- Filled: `false` (kein grauer Hintergrund)

```dart
TextField(
  decoration: InputDecoration(
    labelText: label,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(PackRadius.md),
      borderSide: const BorderSide(color: PackColors.packGray300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(PackRadius.md),
      borderSide: const BorderSide(color: PackColors.packBlue, width: 2),
    ),
  ),
)
```

---

## AppBar

- Hintergrund: `packWhite`
- Titel-Farbe: `packGray900`, `titleLarge`
- Leading-Icon: `packGray700`
- Actions-Icons: `packGray700`
- Elevation: 0
- Bottom-Border: `packGray300`, 1 px (via `PreferredSize` oder `bottom`)
- **Keine** farbigen AppBars (Rollen-Farbe kommt nur in den Nav-Items)

---

## BottomNavigationBar

- Hintergrund: `packWhite`
- Top-Border: `packGray300`, 1 px
- Selektiertes Item: Rollen-Akzentfarbe (je Modul lokal definiert)
- Nicht-selektiertes Item: `packGray500`
- Label: immer sichtbar (`showUnselectedLabels: true`)
- Typ: `BottomNavigationBarType.fixed`

---

## ListTiles

- Divider: `Divider(color: PackColors.packGray300, height: 1)`
- Leading-Icons: 24 × 24 px, `packGray700`
- Title: `bodyLarge`, `packGray900`
- Subtitle: `bodyMedium`, `packGray500`
- Trailing-Chevron: `Icons.chevron_right`, `packGray300`

---

## Badges / Status-Chips

| Status | Hintergrund | Textfarbe |
|---|---|---|
| active / Erfolg | `packGreenLight` | `packGreen` |
| pending | `packAmberLight` | `packAmber` |
| revoked / Fehler | `packRedLight` | `packRed` |
| neutral | `packGray100` | `packGray700` |

```dart
Container(
  padding: const EdgeInsets.symmetric(
    horizontal: PackSpacing.sm,
    vertical: PackSpacing.xs,
  ),
  decoration: BoxDecoration(
    color: PackColors.packGreenLight,
    borderRadius: BorderRadius.circular(PackRadius.sm),
  ),
  child: Text(
    label,
    style: PackText.labelSmall.copyWith(color: PackColors.packGreen),
  ),
)
```

---

## Spacing-Prinzip

Nur Token-Werte verwenden — keine Magic Numbers.

```
xs  =  4 px   (innere Chips, Icons-Gap)
sm  =  8 px   (enge Listen, Badge-Padding)
md  = 12 px   (Button-Padding vertikal, kleine Cards)
lg  = 16 px   (Standard-Screen-Padding, Card-Innen)
xl  = 24 px   (Section-Abstände, Button-Padding horizontal)
xxl = 32 px   (Screen-Top-Padding, große Sektionen)
```

---

## Ladezeiten / Empty States

- Loading: `CircularProgressIndicator(color: PackColors.packBlue)`, zentriert
- Empty State: Icon (64 px, `packGray300`) + kurzer Text (`bodyMedium`, `packGray500`)
- Error State: Text in `packRed`, Retry-Button als `OutlinedButton`
