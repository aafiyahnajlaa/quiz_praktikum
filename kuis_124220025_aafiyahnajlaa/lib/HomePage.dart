import 'package:flutter/material.dart';
import 'dummy-fakultas.dart';
import 'DetailPage.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({Key? key, required this.username}) : super(key: key);

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(username: username)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Halo, $username",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.lightGreen),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child:
            Text("LOGOUT"),
          ),
        ],
      ),

      body: Column(
        children: [
          // Card yang dapat diklik
          GestureDetector(
            onTap: () => _navigateToDetail(context),
            child: Card(
              color: Colors.green,
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sudahkah kamu mengenal UPN Jogja?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "UPN Jogja adalah kampus favorit di DIY lho! Kenalan lebih jauh yuk!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Kenalan lebih jauh yuk!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Judul daftar fakultas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "List Fakultas UPNYK",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          // ListView untuk fakultas
          Expanded(
            child: ListView.builder(
              itemCount: facultyList.length,
              itemBuilder: (context, index) {
                final Faculty faculty = facultyList[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  color: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar fakultas di sebelah kiri
                        Image.network(
                          faculty.imageUrls[2], // Ganti dengan URL gambar yang sesuai
                          width: 80, // Atur lebar gambar
                          height: 80, // Atur tinggi gambar
                          fit: BoxFit.cover, // Atur penyesuaian gambar
                        ),
                        SizedBox(width: 16), // Spasi antara gambar dan teks
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fakultas: ${faculty.name}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text("${faculty.numberOfMajors} Jurusan"),
                              Text("${faculty.numberOfStudents} Mahasiswa"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}