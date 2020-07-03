import 'package:flutter/material.dart';
import 'package:inews/Models/article.dart';
import 'package:inews/Pages/article_page.dart';
import 'package:inews/Src/news.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  const CategoryNews({Key key, @required this.category}) : super(key: key);
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = List<ArticleModel>();
  bool _isLoading = true;

  void getCatogorynews() async {
    CategoryNewsNow news = CategoryNewsNow();
    await news.getCatogoryNews(widget.category);
    articles = news.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    getCatogorynews();
    super.initState();
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
                  color: Color(0xff128807),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2),
            ),
            Text(
              'News',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2),
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              height: 14,
              child: Image.asset('images/flag.png'),
            )
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          Opacity(
            // just to adjust and make the tittle in center not a best practice to do this
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.save)),
          )
        ],
      ),
      body: _isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Container(
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
                  url: articles[index].url ?? "",
                ),
              ),
            ),
    );
  }
}

class NewsTitles extends StatelessWidget {
  final String imageUrl, tittle, desc, url;

  NewsTitles(
      {@required this.imageUrl,
      @required this.tittle,
      this.desc,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          SizedBox(
            height: 4,
          ),
          Material(
            child: RaisedButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleNews(
                      imageUrl: url,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.chrome_reader_mode),
              label: Text('Read More'),
            ),
          )
        ],
      ),
    );
  }
}
