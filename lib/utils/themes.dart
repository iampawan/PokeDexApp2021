import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.green,
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
  }
}
