import 'package:flutter/material.dart';
import 'package:weather_app/home_screen/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white)
        )
      ),
      debugShowCheckedModeBanner: false,
      home:Home()
    );
  }
}
