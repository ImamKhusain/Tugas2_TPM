import 'package:flutter/material.dart';
// import 'penjumlahan.dart';
// import 'bilangan.dart';
// import 'deret.dart';
// import 'bangun.dart';
// import 'stopwatch.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget menuButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(title, style: const TextStyle(fontSize: 18)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Utama"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              "Aplikasi Pemrograman Mobile",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // menuButton(context, "Penjumlahan & Pengurangan", PenjumlahanPage()),

            // menuButton(context, "Bilangan (Ganjil/Genap & Prima)", BilanganPage()),

            // menuButton(context, "Jumlah Total Angka (Deret)", DeretPage()),

            // menuButton(context, "Stopwatch", StopwatchPage()),

            // menuButton(context, "Volume Piramida", BangunPage()),

          ],
        ),
      ),
    );
  }
}