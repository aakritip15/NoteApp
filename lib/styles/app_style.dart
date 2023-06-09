import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color(0xFFe2e2ff);
  static Color mainColor = Colors.teal;
  static Color appBar = Colors.teal.shade800;
  static Color accentColor = Color(0xFF0065ff);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100
  ];

  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mainContent = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle DateTitle = GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );
}
