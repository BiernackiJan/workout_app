import 'package:flutter/material.dart';
import 'package:workout_app/video_info.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(//TODO import get library, first change in pubspec.yami
      debugShowCheckedModeBanner: true, //TODO: check if this takes out the notification bar

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoInfo(),
      // HomePage(),
    );
  }
}