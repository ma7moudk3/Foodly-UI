import 'package:flutter/material.dart';
import 'package:foodly_test/screens/meal_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFFCA40),
        scaffoldBackgroundColor: Colors.white,
        accentColor: Colors.black,
        cardColor: Color(0xFF232323),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MealDetailsScreen(),
    );
  }
}
