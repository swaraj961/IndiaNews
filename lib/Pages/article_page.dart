import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleNews extends StatefulWidget {
  final String imageUrl;

  const ArticleNews({Key key, this.imageUrl}) : super(key: key);
  @override
  _ArticleNewsState createState() => _ArticleNewsState();
}

class _ArticleNewsState extends State<ArticleNews> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

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
      body: Container(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.imageUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
