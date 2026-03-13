import 'package:flutter/material.dart';

class PenjumlahanScreen extends StatefulWidget {
  const PenjumlahanScreen({super.key});

  @override
  State<PenjumlahanScreen> createState() => _PenjumlahanScreenState();
}

class _PenjumlahanScreenState extends State<PenjumlahanScreen> {
  // Controller untuk menangkap teks yang diketik user
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  
  String _hasil = "0";

  // Fungsi untuk menghitung (operasi '+' atau '-')
  void _hitung(String operasi) {
    // Ubah text menjadi angka desimal (double) agar bisa hitung koma juga
    double? angka1 = double.tryParse(_angka1Controller.text);
    double? angka2 = double.tryParse(_angka2Controller.text);

    // Validasi jika input kosong atau bukan angka
    if (angka1 == null || angka2 == null) {
      setState(() {
        _hasil = "Input tidak valid!";
      });
      return;
    }

    double hasilHitung = 0;
    if (operasi == '+') {
      hasilHitung = angka1 + angka2;
    } else if (operasi == '-') {
      hasilHitung = angka1 - angka2;
    }

    setState(() {
      // Hilangkan '.0' di belakang jika hasilnya adalah bilangan bulat
      if (hasilHitung == hasilHitung.toInt()) {
         _hasil = hasilHitung.toInt().toString();
      } else {
         _hasil = hasilHitung.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjumlahan & Pengurangan'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _angka1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka Pertama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _angka2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka Kedua',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _hitung('+'),
                  icon: const Icon(Icons.add),
                  label: const Text('Tambah'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _hitung('-'),
                  icon: const Icon(Icons.remove),
                  label: const Text('Kurang'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text('Hasil:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(
              _hasil,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}