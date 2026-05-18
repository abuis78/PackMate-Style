// PackMate Design-Tokens — Source of Truth
// Wird 1:1 nach packages/packmate_kernel/lib/src/tokens/packmate_tokens.dart übernommen.
// Keine Widgets, keine Logik — nur Daten.

import 'package:flutter/material.dart';

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

/// Fertig konfiguriertes ThemeData — in main.dart verwenden.
ThemeData buildPackmateTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: PackColors.packBlue,
      primary: PackColors.packBlue,
      onPrimary: PackColors.packWhite,
      secondary: PackColors.packAmber,
      onSecondary: PackColors.packWhite,
      error: PackColors.packRed,
      onError: PackColors.packWhite,
      surface: PackColors.packWhite,
      onSurface: PackColors.packGray900,
    ),
    scaffoldBackgroundColor: PackColors.packWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: PackColors.packWhite,
      foregroundColor: PackColors.packGray900,
      elevation: 0,
      titleTextStyle: PackText.titleLarge,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: PackColors.packBlue,
        foregroundColor: PackColors.packWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PackRadius.md),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: PackSpacing.md,
          horizontal: PackSpacing.xl,
        ),
        textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: PackColors.packBlue,
        side: const BorderSide(color: PackColors.packBlue, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PackRadius.md),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: PackSpacing.md,
          horizontal: PackSpacing.xl,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: PackColors.packBlue,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(PackRadius.md),
        borderSide: const BorderSide(color: PackColors.packGray300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(PackRadius.md),
        borderSide: const BorderSide(color: PackColors.packGray300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(PackRadius.md),
        borderSide: const BorderSide(color: PackColors.packBlue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(PackRadius.md),
        borderSide: const BorderSide(color: PackColors.packRed),
      ),
      labelStyle: PackText.bodyMedium,
      floatingLabelStyle: const TextStyle(
        color: PackColors.packBlue, fontSize: 14, fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: PackSpacing.lg,
        vertical: PackSpacing.md,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: PackColors.packWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PackRadius.lg),
        side: const BorderSide(color: PackColors.packGray300),
      ),
      margin: EdgeInsets.zero,
    ),
    dividerTheme: const DividerThemeData(
      color: PackColors.packGray300,
      thickness: 1,
      space: 1,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: PackColors.packBlue,
    ),
  );
}
