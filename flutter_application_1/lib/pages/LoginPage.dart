import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? nickname;
  String username = '';
  String password = '';
  bool isLoginSucces = true;
  bool visible = true;

  //function redirect
  _navigatetoHome() async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  username: username,
                  nickname: nickname,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Column(
        children: [
          nicknameField(),
          usernameField(),
          passwordField(),
          LoginButton(context),
        ],
      ),
    ));
  }

  Widget nicknameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          nickname = value;
        },
        decoration: const InputDecoration(
            hintText: 'Nickname',
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }

  Widget usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        decoration: const InputDecoration(
            hintText: 'Username',
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: visible,
        decoration: InputDecoration(
            suffix: IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
            ),
            hintText: 'Password',
            contentPadding: const EdgeInsets.all(8),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }

  Widget LoginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'admin' && password == 'admin') {
            setState(() {
              text = "Login Berhasil";
              isLoginSucces = true;
              _navigatetoHome();
            });
          } else {
            setState(() {
              text = "Login Gagal";
              isLoginSucces = false;
            });
          }

          SnackBar snackBar = SnackBar(
            content: Text(text),
            backgroundColor: isLoginSucces ? Colors.green : Colors.red,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }
}
