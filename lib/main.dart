import 'package:flutter/material.dart';
import 'package:teori_kelompok/screen/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Dart',
      home: HomePage(),
    );
  }
}