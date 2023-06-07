import 'package:api/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var rng = Random();
    // for (var i = 0; i < 10; i++) {
    //   print(rng.nextInt(7438));
    // }

    return const MaterialApp(
      home: Home(),
    );
  }
}

