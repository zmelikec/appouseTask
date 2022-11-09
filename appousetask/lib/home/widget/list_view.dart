import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  final int id;
  final String title;
  final String category;
  final String urlAvatar;
  final int price;

  DataItem(this.id, this.title, this.category, this.urlAvatar, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 200,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white70),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
