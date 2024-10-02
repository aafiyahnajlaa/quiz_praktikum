import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = true;

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage(username: username)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text("BELA NEGARA",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              Image.asset('images/logo_upn.png'),
              _usernameField(),
              _passwordField(),
              _LoginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          fillColor: Colors.white, // Set background color to white
          filled: true, // Enable fill color
          icon: Icon(Icons.person),
          hintText: 'Username',
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(

            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess) ? Colors.green : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: visible,
        decoration: InputDecoration(
          fillColor: Colors.white, // Set background color to white
          filled: true, // Enable fill color
          icon: Icon(Icons.lock),
          hintText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility_off),
            onPressed: () {
              setState(() {
                visible = !visible; // Implement password visibility toggle if needed
              });
            },
          ),
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black12),
          ),
        ),
      ),
    );
  }

  Widget _LoginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'Aafiyah najlaa' && password == 'user123') {
            _navigateToHome();

            setState(() {
              text = 'Login Berhasil';
              isLoginSuccess = true;
            });
          } else {
            setState(() {
              text = 'Login Gagal';
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(
            content: Text(text),
            backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF005700),
          foregroundColor: Colors.white,// Set button color to green
        ),
        child: Text("Login"),
      ),
    );
  }
}