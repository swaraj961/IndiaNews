import 'package:flutter/material.dart';
import 'package:inews/Models/category.dart';
import 'package:inews/Src/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = List<CategoryModel>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    // returns the list to list vai the the function in data models
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'India',
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.w800),
            ),
            Text(
              'News',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 13,
              child: Image.asset('images/flag.png'),
            )
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => CategoryTiles(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTiles extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  CategoryTiles({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
