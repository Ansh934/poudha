import 'package:flutter/material.dart';
import 'pages/root_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poudha',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
          primary: const Color(0xFF4CAF50),
          secondary: const Color(0xFF81C784),
          surface: const Color(0xFFF1F8E9),
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFF2E7D32),
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Color(0xFF388E3C),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const RootPage(),
    );
  }
}