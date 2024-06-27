import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarana_hidayah/view/catalog_screen.dart';
import 'package:sarana_hidayah/view/login_screen.dart';
import 'package:sarana_hidayah/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const CatalogScreen(),
            );
          }
        });
  }
}
