import 'package:flutter/material.dart';

class DeretScreen extends StatefulWidget {
  const DeretScreen({super.key});

  @override
  State<DeretScreen> createState() => _DeretScreenState();
}

class _DeretScreenState extends State<DeretScreen> {
  final TextEditingController _inputController = TextEditingController();
  
  String _hasilRincian = "";
  String _totalJumlah = "0";

  void _hitungTotalDigit() {
    String input = _inputController.text.trim();

    // Validasi jika input kosong
    if (input.isEmpty) {
      setState(() {
        _hasilRincian = "";
        _totalJumlah = "Input kosong!";
      });
      return;
    }

    // Validasi menggunakan Regex agar user hanya bisa memasukkan angka
    if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
       setState(() {
        _hasilRincian = "";
        _totalJumlah = "Harap masukkan angka bulat saja!";
      });
      return;
    }

    int total = 0;
    List<String> rincian = [];

    // Looping untuk memecah string menjadi digit tunggal
    for (int i = 0; i < input.length; i++) {
      int digit = int.parse(input[i]);
      total += digit;           // Tambahkan ke total
      rincian.add(input[i]);    // Simpan untuk tampilan rincian (1 + 2 + ...)
    }

    setState(() {
      _hasilRincian = rincian.join(' + '); // Gabungkan list dengan tanda +
      _totalJumlah = total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jumlah Total Digit'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Masukkan deret angka tanpa spasi. Aplikasi akan menjumlahkan setiap digitnya.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Angka Panjang',
                hintText: 'Contoh: 1234',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                onPressed: _hitungTotalDigit,
                child: const Text('Hitung Total', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 40),
            const Text('Hasil:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            // Menampilkan rincian (misal: 1 + 2 + 3 = 6)
            if (_hasilRincian.isNotEmpty)
              Text(
                '$_hasilRincian \n= $_totalJumlah',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            else
              Text(
                _totalJumlah,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              )
          ],
        ),
      ),
    );
  }
}