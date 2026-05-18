// PackMate Design-Tokens — Source of Truth
// Wird 1:1 nach packages/packmate_kernel/lib/src/tokens/packmate_tokens.dart übernommen.
// Keine Widgets, keine Logik — nur Daten.

// painting.dart ist widget-frei (Color, TextStyle, BorderRadius etc.)
// buildPackmateTheme() lebt in lib/main.dart (braucht material.dart → App-Layer)
import 'package:flutter/painting.dart';

// ── Farben ────────────────────────────────────────────────────────────────────

abstract final class PackColors {
  // Primär
  static const packBlue      = Color(0xFF2B6CB0);
  static const packBlueDark  = Color(0xFF1A4A7A);
  static const packBlueLight = Color(0xFFEBF4FF);

  // Akzent
  static const packAmber      = Color(0xFFD97706);
  static const packAmberLight = Color(0xFFFEF3C7);
  static const packGreen      = Color(0xFF2D9B5A);
  static const packGreenLight = Color(0xFFD1FAE5);
  static const packRed        = Color(0xFFDC2626);
  static const packRedLight   = Color(0xFFFEE2E2);

  // Neutral
  static const packGray900 = Color(0xFF111827);
  static const packGray700 = Color(0xFF374151);
  static const packGray500 = Color(0xFF6B7280);
  static const packGray300 = Color(0xFFD1D5DB);
  static const packGray100 = Color(0xFFF3F4F6);
  static const packWhite   = Color(0xFFFFFFFF);

  // Status-Semantik (Aliase)
  static const success        = packGreen;
  static const successSurface = packGreenLight;
  static const warning        = packAmber;
  static const warningSurface = packAmberLight;
  static const error          = packRed;
  static const errorSurface   = packRedLight;
}

// ── Spacing ───────────────────────────────────────────────────────────────────

abstract final class PackSpacing {
  static const double xs  =  4;
  static const double sm  =  8;
  static const double md  = 12;
  static const double lg  = 16;
  static const double xl  = 24;
  static const double xxl = 32;
}

// ── Border-Radien ─────────────────────────────────────────────────────────────

abstract final class PackRadius {
  static const double sm  =  6;
  static const double md  = 12;
  static const double lg  = 16;
  static const double xl  = 24;
  static const double full = 999; // Pill / Circle
}

// ── Typografie ────────────────────────────────────────────────────────────────

abstract final class PackText {
  static const displayLarge = TextStyle(
    fontSize: 32, fontWeight: FontWeight.w700, height: 1.2,
    color: PackColors.packGray900,
  );
  static const headlineMedium = TextStyle(
    fontSize: 24, fontWeight: FontWeight.w600, height: 1.3,
    color: PackColors.packGray900,
  );
  static const titleLarge = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w600, height: 1.4,
    color: PackColors.packGray900,
  );
  static const bodyLarge = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w400, height: 1.5,
    color: PackColors.packGray900,
  );
  static const bodyMedium = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400, height: 1.5,
    color: PackColors.packGray700,
  );
  static const labelSmall = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w500, height: 1.4,
    color: PackColors.packGray700,
  );
}

// ── ThemeData ─────────────────────────────────────────────────────────────────
// buildPackmateTheme() gehört ins App-Layer (lib/main.dart), nicht in den Kernel.
// ThemeData braucht package:flutter/material.dart (Widget-haltig) — das bleibt
// außerhalb von packmate_kernel (Contract G1=B: Kernel widget-frei).
//
// Die vollständige Implementierung befindet sich in lib/main.dart des
// PackMate-1.0-Repos. Tokens (PackColors, PackSpacing, PackText, PackRadius)
// werden dort referenziert.
