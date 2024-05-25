import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock View',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF2D2F41),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'avenir'),
      debugShowCheckedModeBanner: false,
      home: const ScreenHome(),
    );
  }
}
