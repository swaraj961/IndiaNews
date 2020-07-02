import 'dart:convert';
import 'package:inews/Models/article.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=64f04510b86c4217ad8eb14178148b40';

    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);

    if (jsondata['status'] == 'ok') {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            tittle: element['title'],
            desc: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt']
          );

          news.add(articleModel);
        }
      });
    }
  }
}
