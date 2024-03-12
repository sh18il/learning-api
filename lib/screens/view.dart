import 'package:flutter/material.dart';

class viewScreen extends StatelessWidget {
  final dynamic image;
  final String name;
  viewScreen({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              
              width: 300,
              height: 300,
              child: ClipRRect( child: Image.network(image)),
            ),
            Text(name)
          ],
        ),
      ),
    );
  }
}
