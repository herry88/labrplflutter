import 'dart:async';

import 'package:flutter/material.dart';
import 'package:labrpl/splash.dart';

void main(){
  runApp(new MaterialApp(
    home: new Present(),
    debugShowCheckedModeBanner: false,
//    routes: <String, WidgetBuilder>{
//      '/HomeScreen' : (BuildContext context) => new HomeScreen()
//    },
  ));
}

class Present extends StatefulWidget {
//  BuildContext get context => null;
  @override
  _PresentState createState() => _PresentState();
}

class _PresentState extends State<Present> {


  @override
  void initState(){
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child:
//        new Image.asset('images/TutWuri2018.png'),
        new Image.asset('images/medukasi.png'),

      ),
//        backgroundColor: Colors.white
    );
  }
}

