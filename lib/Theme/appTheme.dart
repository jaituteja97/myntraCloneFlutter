import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview/Theme/pallets.dart';

ThemeData appTheme(context) {
  return ThemeData(
    primaryColor: appThemeColor,
    textTheme: GoogleFonts.latoTextTheme(
      Theme.of(context).textTheme,
    ),
  );
}
