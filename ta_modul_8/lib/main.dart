import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentra UMKM & Kreatif Bandung',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HalamanSentra(),
    );
  }
}

class HalamanSentra extends StatelessWidget {
  const HalamanSentra({super.key});

  // ---------- DATA KLASTER (untuk GridView) ----------
  static const List<Map<String, dynamic>> klasterList = [
    {'nama': 'Kerajinan Sepatu & Kulit', 'kawasan': 'Cibaduyut', 'unit': 420, 'icon': Icons.shopping_bag},
    {'nama': 'Industri Tekstil & Rajut', 'kawasan': 'Binong Jati', 'unit': 310, 'icon': Icons.checkroom},
    {'nama': 'Sablon & Kaos Kreatif', 'kawasan': 'Suci / Surapati', 'unit': 280, 'icon': Icons.palette},
    {'nama': 'Kuliner Olahan Rakyat', 'kawasan': 'Pasirkoja', 'unit': 190, 'icon': Icons.restaurant},
  ];

  // ---------- DATA DIREKTORI (untuk ListView) ----------
  static const List<Map<String, dynamic>> sentraList = [
    {
      'nama': 'Sentra Sepatu Cibaduyut',
      'kawasan': 'Jl. Cibaduyut Raya No. 1-150, Bandung',
      'jumlahPerajin': 420,
      'statusBinaan': 'Binaan Mandiri',
      'jamBuka': '08:00 - 20:00 WIB',
      'icon': Icons.shopping_bag,
    },
    {
      'nama': 'Sentra Rajut Kreatif Binong Jati',
      'kawasan': 'Jl. Binong Jati No. 24, Bandung',
      'jumlahPerajin': 310,
      'statusBinaan': 'Binaan Mandiri',
      'jamBuka': '08:30 - 17:00 WIB',
      'icon': Icons.checkroom,
    },
    {
      'nama': 'Sentra Sablon & Kaos Suci',
      'kawasan': 'Jl. Surapati No. 80-120, Bandung',
      'jumlahPerajin': 280,
      'statusBinaan': 'Binaan Baru',
      'jamBuka': '09:00 - 19:00 WIB',
      'icon': Icons.palette,
    },
    {
      'nama': 'Sentra Kuliner Pasirkoja',
      'kawasan': 'Jl. Pasirkoja, Bandung',
      'jumlahPerajin': 190,
      'statusBinaan': 'Binaan Baru',
      'jamBuka': '07:00 - 21:00 WIB',
      'icon': Icons.restaurant,
    },
  ];

  // ---------- BANNER ----------
  Widget buildBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Komitmen Pemberdayaan Sentra Industri Rakyat',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'Mendukung sentra industri unggulan & 1.285 perajin aktif binaan Kota Bandung.',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // ---------- GRID KLASTER ----------
  Widget buildKlasterGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Klaster Unggulan Sentra Industri',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: klasterList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.3,
          ),
          itemBuilder: (context, index) {
            final item = klasterList[index];
            return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.deepPurple.shade100,
                      child: Icon(item['icon'],
                          size: 18, color: Colors.deepPurple.shade900),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['nama'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${item['unit']} Unit Usaha',
                            style: const TextStyle(
                                fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // ---------- DIREKTORI ----------
  Widget buildDirektori() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Direktori Unit Sentra Binaan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: sentraList.length,
          itemBuilder: (context, index) {
            final item = sentraList[index];
            final bool isMandiri = item['statusBinaan'] == 'Binaan Mandiri';

            return Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple.shade100,
                  child: Icon(item['icon'], color: Colors.deepPurple.shade900),
                ),
                title: Text(
                  item['nama'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      '${item['kawasan']} • ${item['jumlahPerajin']} UKM',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Buka: ${item['jamBuka']}',
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
                trailing: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isMandiri
                        ? Colors.green.shade50
                        : Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isMandiri ? Colors.green : Colors.blue,
                    ),
                  ),
                  child: Text(
                    item['statusBinaan'],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: isMandiri
                          ? Colors.green.shade800
                          : Colors.blue.shade800,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sentra UMKM & Kreatif Bandung'),
        backgroundColor: Colors.deepPurple.shade50,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBanner(),
            const SizedBox(height: 20),
            buildKlasterGrid(),
            const SizedBox(height: 20),
            buildDirektori(),
          ],
        ),
      ),
    );
  }
}