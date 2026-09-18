import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const CadastroPessoasApp());
}

class CadastroPessoasApp extends StatelessWidget {
  const CadastroPessoasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'People',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C4AB6),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}