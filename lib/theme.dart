import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFFEB1555);
const Color kBackgroundColor = Color(0xFF0A0E21);
const Color kItemBackgroundColor = Color.fromARGB(255, 35, 41, 70);

final theme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: kBackgroundColor,
    elevation: 0,
  ),
  sliderTheme: SliderThemeData(
    thumbColor: kPrimaryColor,
    activeTrackColor: Colors.white,
    overlayColor: kPrimaryColor.withAlpha(0x29),
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: 15),
  ),
);
