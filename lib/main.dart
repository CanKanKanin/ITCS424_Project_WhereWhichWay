import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
      ()=> {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const HomePage())),
        debugPrint("After 5 seconds, navigate to Home Page"),
      }
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Align(
          child: Text("Ratatouille Lasagna\n\nWhereWhichWay", 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, 
            fontWeight: FontWeight.w800,
            color: Colors.white),
          ),
        ),
      ),
    );
  }
}