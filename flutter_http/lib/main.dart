// import 'package:flutter_http/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http/users.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Directory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: UsersPage(),
    );
  }

}