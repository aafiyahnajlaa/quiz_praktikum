import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class DetailPage extends StatefulWidget {
  final String username;

  DetailPage({Key? key, required this.username}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _description = "";

  @override
  void initState() {
    super.initState();
    _loadDescription();
  }

  Future<void> _loadDescription() async {
    try {
      String text = await rootBundle.loadString('assets/narasi_detail.txt');
      setState(() {
        _description = text;
      });
    } catch (e) {
      // Handle error (e.g., file not found)

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Detail UPNVY",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'images/upn.jpg',
                  width: 120, // Atur lebar gambar jika diperlukan
                  height: 150, // Atur tinggi gambar jika diperlukan
                  fit: BoxFit.cover, // Penyesuaian gambar
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Pendidikan UPN:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 8),
              Text(
                "Arah Pendidikan",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 8),
              Text(
                "Arah pendidikan UPN ”Veteran” Yogyakarta adalah mengembangkan ilmu pengetahuan dan teknologi yang dilandasi oleh nilai-nilai kedisiplinan, "
                    "kejuangan, kreativitas, keunggulan, kebangsaan, dan kejujuran dalam rangka menunjang pembangunan nasional melalui bidang pendidikan tinggi dalam rangka terciptanya sumber daya manusia yang unggul di era global dengan dilandasi jiwa bela negara.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Tujuan Pendidikan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 8),
              Text(
                "Pendidikan di UPN ”Veteran” Yogyakarta bertujuan untuk:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                "1. Menyelenggarakan pendidikan dan pengajaran yang berkualitas guna menghasilkan lulusan berdaya saing global yang memiliki jiwa disiplin, berdaya juang dan, kreatif serta berwawasan kebangsaan dan mampu menjadi komponen pendukung dalam sistem pertahanan negara.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                "2. Meningkatkan kuantitas dan kualitas penelitian guna:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                "   a. Menunjang pengembangan mutu pendidikan dan pengajaran\n"
                    "   b. Mengembangkan dan menerapkan ilmu pengetahuan dan teknologi (IPTEK) untuk menunjang pengabdian kepada masyarakat; dan\n"
                    "   c. Menghasilkan modal intelektual dan karya ilmiah dalam rangka menunjang pembangunan nasional.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                "3. Pengembangan kegiatan pengabdian kepada masyarakat melalui:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                "   a. Penyediaan layanan ilmu pengetahuan dan teknologi (IPTEK) dalam rangka meningkatkan kesejahteraan masyarakat;\n"
                    "   b. Peningkatan keberdayaan masyarakat; dan\n"
                    "   c. Peningkatan reputasi UPN ”Veteran” Yogyakarta.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }
}