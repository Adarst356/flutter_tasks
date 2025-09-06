import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tasks/screens/login_page.dart';

import 'apiservice/api_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Register ProductApiService
  Get.put(ProductApiService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
    );
  }
}
