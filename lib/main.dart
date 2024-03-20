import 'package:flutter/material.dart';
import 'package:pizza_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFF0A1529),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFFB325),
            secondary: const Color(0xFFFFB325)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
