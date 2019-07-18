import 'dart:async';
import 'package:flutter/material.dart';
//import swiggy page code
import 'package:labrpl/present.dart';


void main(){
  runApp(new MaterialApp(
    home: new SplashScreen(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/Present' : (BuildContext context) => new Present()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async{
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage(){
    Navigator.of(context).pushReplacementNamed('/Present');
  }

  @override
  void initState(){
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child:
//        new Image.asset('images/TutWuri2018.png'),
          new Image.asset('images/TutWuri2018.png'),

        ),
        backgroundColor: Colors.white
    );
  }
}
