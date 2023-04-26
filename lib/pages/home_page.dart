
import 'package:bci/pages/home_page.dart';


import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Home"),
          backgroundColor: Colors.deepPurple[800]),
    );
  }
}