import 'package:flutter/material.dart';
import 'package:prak4/pages/home.dart';
import '../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggedin = false;

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (users.any(
      (user) => user.email == email && user.password == password,
    )) {
      setState(() {
        isLoggedin = true;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Berhasil"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("login gagal: email atau password kalian salah"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // void _logout() {
  //   setState(() {
  //     isLoggedin = false;
  //     _emailController.clear();
  //     _passwordController.clear();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ku2Buku", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              _emailField(_emailController),
              _passwordField(_passwordController),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _emailField(TextEditingController emailController) {
  return Container(
    padding: EdgeInsets.only(bottom: 12),
    child: TextField(
      controller: emailController,
      enabled: true,
      decoration: InputDecoration(
        hintText: "email kamu",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    ),
  );
}

Widget _passwordField(TextEditingController controller) {
  return Container(
    child: TextField(
      controller: controller,
      obscureText: true,
      enabled: true,
      decoration: InputDecoration(
        hintText: "password kamu",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    ),
  );
}
