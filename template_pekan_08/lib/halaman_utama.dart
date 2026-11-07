// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'data/hospital_data.dart';
import 'models/hospital_model.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  // TUGAS 1 
  Widget buildSearchAndCategoryBar() {
    final List<String> kategoriList = [
      'Semua', 'RSUD Siaga', 'Puskesmas', 'Klinik 24 Jam', 'Apotek'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey.shade600),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari fasilitas kesehatan di Kota Bandung...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,          // TODO 1
            itemCount: kategoriList.length,            // TODO 2
            itemBuilder: (BuildContext context, int index) { // TODO 3
              final bool isSelected = index == 0;      // TODO 4

              return Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.white, // TODO 5
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade300,
                  ),
                ),
                child: Center(
                  child: Text(
                    kategoriList[index],               // TODO 6
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.white : Colors.black, // TODO 7
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  // TUGAS 2
  Widget buildQuickActionGrid() {
    final List<Map<String, dynamic>> menuAksi = [
      {'title': 'Ambulans 119', 'icon': Icons.medical_services, 'color': Colors.red},
      {'title': 'IGD 24 Jam', 'icon': Icons.local_hospital, 'color': Colors.orange},
      {'title': 'Donor Darah PMI', 'icon': Icons.bloodtype, 'color': Colors.red.shade700},
      {'title': 'Halo Dinkes', 'icon': Icons.phone_in_talk, 'color': Colors.green},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Layanan Tanggap Darurat Kota Bandung',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,                            // TODO 1
          itemCount: menuAksi.length,                  // TODO 2
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,                         // TODO 3
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.25,                    // TODO 4
          ),
          itemBuilder: (BuildContext context, int index) {
            final item = menuAksi[index];              // TODO 5

            return Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: item['color'].withOpacity(0.12), // TODO 6
                      radius: 22,
                      child: Icon(item['icon'], color: item['color'], size: 24), // TODO 7
                    ),
                    SizedBox(height: 8),
                    Text(
                      item['title'],                   // TODO 8
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  // TUGAS 3
  Widget buildHospitalDirectory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fasilitas Kesehatan Rujukan Siaga',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,                            // TODO 1
          itemCount: mockHospitals.length,             // TODO 2
          itemBuilder: (BuildContext context, int index) {
            final hospital = mockHospitals[index];     // TODO 3

            return Card(
              elevation: 2,
              margin: EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                leading: CircleAvatar(
                  backgroundColor: hospital.isIgdOpen
                      ? Colors.blue.shade50
                      : Colors.red.shade50,
                  child: Icon(
                    Icons.local_hospital,              // TODO 4
                    color: hospital.isIgdOpen ? Colors.blue : Colors.red,
                  ),
                ),
                title: Text(
                  hospital.name,                       // TODO 5
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(hospital.address, style: TextStyle(fontSize: 12)), // TODO 6
                    SizedBox(height: 2),
                    Text(
                      'Sisa Tempat Tidur: ${hospital.availableBeds}',        // TODO 7
                      style: TextStyle(
                          fontSize: 11, color: Colors.grey.shade700),
                    ),
                  ],
                ),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: hospital.isIgdOpen
                        ? Colors.green.shade100
                        : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    hospital.isIgdOpen ? 'IGD BUKA' : 'IGD TUTUP', // TODO 8
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: hospital.isIgdOpen
                          ? Colors.green.shade800
                          : Colors.red.shade800,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  //TUGAS 4
  Widget buildEmergencySeparated() {
    final List<Map<String, String>> kontakDarurat = [
      {'nama': 'PSC 119 Kota Bandung', 'nomor': '119 / 022-119'},
      {'nama': 'Command Center Bandung', 'nomor': '112'},
      {'nama': 'Posko PMI Kota Bandung', 'nomor': '022-4207019'},
      {'nama': 'Dinas Kesehatan Siaga', 'nomor': '022-4203752'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nomor Penting Kedaruratan Kota Bandung',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,                          // TODO 1
            itemCount: kontakDarurat.length,           // TODO 2
            separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 1, color: Colors.grey.shade300); // TODO 3
            },
            itemBuilder: (BuildContext context, int index) {
              final item = kontakDarurat[index];       // TODO 4

              return ListTile(
                leading: Icon(Icons.emergency, color: Colors.red), // TODO 5
                title: Text(item['nama']!,             // TODO 6
                    style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold)),
                subtitle: Text(item['nomor']!,         // TODO 7
                    style: TextStyle(
                        fontSize: 12, color: Colors.blue.shade800)),
                trailing: IconButton(
                  icon: Icon(Icons.phone, color: Colors.green), // TODO 8
                  onPressed: () {
                    print('Menghubungi ${item['nama']}');
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kesehatan Siaga Kota Bandung'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSearchAndCategoryBar(),
            buildQuickActionGrid(),
            buildHospitalDirectory(),
            buildEmergencySeparated(),
          ],
        ),
      ),
    );
  }
}