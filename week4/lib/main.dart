import 'package:flutter/material.dart';
import 'package:week4/ProfileScreen.dart';
import 'package:week4/UserProfileScreen.dart';

import 'Api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'week4',
      home: PicsumPhotosApi(),
    );
  }
}