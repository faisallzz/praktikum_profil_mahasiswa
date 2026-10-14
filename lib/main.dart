import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const ProfilPage(),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  // ====== DATA MAHASISWA ======
  static const String nama = 'Ahmad Faizal Bahri';
  static const String nim = '2495114009';
  static const String prodi = 'Teknik Informatika';
  static const String universitas = 'Universitas Hasyim Asy\'ari (UNHASY) Tebuireng Jombang';
  static const String hobi = 'Mendengarkan musik.';
  static const String infoTambahan = 'Mahasiswa Teknik Informatika yang sedang belajar pemrograman mobile menggunakan Flutter.';
  // =====================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ---------- Foto profil ----------
            // Jika punya foto, ganti dengan:
            // backgroundImage: AssetImage('assets/foto.jpg'),
            // (daftarkan asset di pubspec.yaml) lalu hapus parameter child.
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 12),

            // ---------- Nama ----------
            const Text(
              nama,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // ---------- Kartu informasi identitas (Container + Column + Row) ----------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  _buildInfoRow('NIM', nim),
                  const Divider(),
                  _buildInfoRow('Program Studi', prodi),
                  const Divider(),
                  _buildInfoRow('Universitas', universitas),
                  const Divider(),
                  _buildInfoRow('Hobi', hobi),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ---------- Informasi tambahan (Card + Row + Icon) ----------
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.image,
                        size: 40,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Informasi Tambahan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(infoTambahan),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ---------- Tombol Detail (ElevatedButton) ----------
            SizedBox(
              width: 260,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Detail Mahasiswa'),
                      content: const Text(
                        'Nama: $nama\nNIM: $nim\nProdi: $prodi\nUniversitas: $universitas',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Tutup'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Detail',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget bantu: satu baris informasi "Label : Nilai" (Row)
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(':  '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}