// import 'package:flutter/cupertino.dart';
import 'package:cap/Dashboard.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';

//Main file
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      //RegisterPage.routeName: (BuildContext context) => RegisterPage(),
      LoginPage.routename:(BuildContext context)=>LoginPage(),
      Dashboard.routeName:(BuildContext context)=>Dashboard(),
    };
    return MaterialApp(
      title: 'Cap',
      home: LoginPage(),
      routes: routes,
    );
  }
}
