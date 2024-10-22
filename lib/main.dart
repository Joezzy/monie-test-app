import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/views/homeView.dart';
import 'package:testapp/views/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.01),
      statusBarColor: Colors.transparent,
    ));



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // theme: ThemeData.dark(),
      // home:  const TestPage(),
      home:  HomeView()
    );
  }
}

