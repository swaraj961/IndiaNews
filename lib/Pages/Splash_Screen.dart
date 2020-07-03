import 'package:flutter/material.dart';
import 'package:inews/Pages/HomePage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff4f8a8b), Color(0xff99d8d0)
                    // Color(0xfff0a500), Color(0xfffa7d09)
                  ],
                ),
                // color: ,
                image: DecorationImage(image: AssetImage('images/news.png'))),
          ),
          // Image.asset(
          //   'images/login-bg.png',
          //   fit: BoxFit.fitHeight,
          // ),

          Positioned(
            top: 60,
            left: 120,
            child: Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w700,
                fontFamily: 'ProductSans',
              ),
            ),
          ),
          Positioned(
            bottom: 620,
            left: 150,
            child: Image.asset(
              'images/flag.png',
              fit: BoxFit.contain,
              height: 80,
              width: 100,
            ),
          ),

          Positioned(
            bottom: 400,
            left: 100,
            child: Center(
              child: Text(
                'IndiaNews',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'ProductSans',
                ),
              ),
            ),
          ),
          Positioned(
            left: 190,
            bottom: 200,
            child: Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )),
          ),
          Positioned(
            left: 100,
            bottom: 30,
            child: Center(
              child: Text(
                'Developed by Swaraj with ❤ India',
                style:
                    TextStyle(color: Colors.white, fontFamily: 'ProductSans'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
