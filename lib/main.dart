import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_app/utils/themes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'views/home/home.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme(),
      darkTheme: Themes.darkTheme(),
      home: Home(),
    );
  }
}
