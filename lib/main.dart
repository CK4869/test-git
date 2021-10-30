import 'package:flutter/material.dart';
import 'package:instagram_app_clone/constant.dart';
import 'package:instagram_app_clone/screens/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram App Clone',
      theme: ThemeData(
        primaryColor: primary,
        scaffoldBackgroundColor: bgWhite,
      ),
      home: const TabScreen(),
    );
  }
}
