import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'I',
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.w800),
            ),
            Text(
              'News',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}

class CategoryTiles extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  CategoryTiles({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(
            imageUrl,
            width: 120,
            height: 60,
          ),
        ],
      ),
    );
  }
}
