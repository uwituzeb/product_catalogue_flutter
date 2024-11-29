import 'package:flutter/material.dart';

class MyThemes {
  // Light Theme
  static final ThemeData light = ThemeData(
    primaryColor: Colors.pink,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.pink,
    ),
  );

  // Dark Theme
  static final ThemeData dark = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
  );
}