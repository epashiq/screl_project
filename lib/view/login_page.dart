import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:screl_project/controller/login_storage/login_storage.dart';
import 'package:screl_project/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('LoginPage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 340,
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.black),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 340,
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Password',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (usernameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        Login.setLogged(usernameController.text);
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const HomePage();
                          },
                        ));
                      } else {
                        log('ERROR');
                      }
                    });
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
