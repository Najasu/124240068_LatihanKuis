import 'package:flutter/material.dart';
import 'detail.dart';
import 'login.dart';
import '../models/bookModels.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book List Page"), 
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 12),
            child: SizedBox(
              width: 36,
              height: 36,
              child: ElevatedButton(
                onPressed: () {
                 Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Icon(Icons.logout, size: 20),
              ),
            ),
          ),
      ],
      backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(bookList[index].title),
            subtitle: Text(bookList[index].author),
            leading: Image.network(bookList[index].imageUrl),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(buku: bookList[index]),
                ),
              );
            },
          );
        },
      )
    );
  }
}
