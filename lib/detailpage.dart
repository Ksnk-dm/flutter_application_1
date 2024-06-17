import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: Container(
            child: Image.network(
                "https://cdn.monopizza.com.ua/mp-ua/products/0001-pica-bavarska.jpg?&w=991&h=700&format=auto&mode=fit&q=60")));
  }
}
