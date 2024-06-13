import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Hello World",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Android app"),
          centerTitle: true,
        ),
        body: Text("HEllo world"),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          ],
        ),
      )));
}
