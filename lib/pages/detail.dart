import 'package:flutter/material.dart';
import '../models/bookModels.dart';

class DetailPage extends StatelessWidget {
  final BookModel buku;
  const DetailPage({super.key, required this.buku});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(buku.title), backgroundColor: Colors.blue),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(buku.imageUrl, height: 250),
                ),
              ),
              SizedBox(height: 16),

              Text(
                buku.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                buku.author,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 8),
              Text('⭐ ${buku.rating}'),

              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 8),

              Text(
                'Deskripsi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(buku.description),

              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 8),

              Text('Genre: ${buku.genre}'),
              SizedBox(height: 8),
              Text('Penerbit: ${buku.publisher}'),
              SizedBox(height: 8),
              Text('Tahun terbit: ${buku.year}'),
              SizedBox(height: 8),
              Text('Jumlah halaman: ${buku.pages}'),

              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: Text("Kembali ke Home"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
