import 'package:flutter/material.dart';

import 'pages/home.dart';

const APP_NAME = 'Flutter Dialog Sample';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DialogPage(
        title: APP_NAME,
      ),
    );
  }
}
