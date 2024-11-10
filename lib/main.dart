import 'package:api_app_test/view/home_store_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomeStoreScreen());
  }
}
