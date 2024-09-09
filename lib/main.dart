import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hw_mvvm_2/View/HomeScreen.dart';

import 'Controller/ItemController.dart';

void main() {
  Get.put(ItemController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MvvM Hw',
      home: HomeScreen(),
    );
  }
}

