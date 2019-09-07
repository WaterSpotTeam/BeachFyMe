import 'dart:async';

import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WATERSPOT',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => MyHomePage()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/WS_Logo.png',
        ),
      ),
    );
  }
}
