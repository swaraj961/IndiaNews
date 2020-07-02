import 'package:flutter/material.dart';
import 'package:inews/Models/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inews/Src/news.dart';
import 'package:inews/Src/data.dart';
import 'package:inews/Models/article.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = List<CategoryModel>();
  List<ArticleModel> articles = List<ArticleModel>();

  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getnews();
    categories = getCategories();
    // returns the list to list vai the the function in data models
  }

  void getnews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _isloading = false;
    });
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
      body: _isloading
          ? Center(
              child: Container(
              child: CircularProgressIndicator(),
            ))
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    // !Category
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

                    // !newsArticle

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      // height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) => NewsTitles(
                          imageUrl: articles[index].urlToImage ?? "",
                          tittle: articles[index].tittle ?? "",
                          desc: articles[index].desc ?? "",
                        ),
                      ),
                    )
                  ],
                ),
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
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                width: 120,
                height: 60,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
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

class NewsTitles extends StatelessWidget {
  final String imageUrl, tittle, desc;

  NewsTitles({@required this.imageUrl, @required this.tittle, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl)),
          SizedBox(
            height: 7,
          ),
          Text(
            tittle,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            desc,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
