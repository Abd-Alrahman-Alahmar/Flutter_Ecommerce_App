import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_8/features/auth/services/auth_service.dart';
import 'package:flutter_8/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

 final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2))..forward();

    animation =  CurvedAnimation(
        parent: controller,
        curve: Curves.linear);

    Timer(
      const Duration(seconds: 5),
        ()=>MyApp(),
    );
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
          child: Center(child: Image.asset("assets/images/logo.png",
            width: 20,))),
         
        ],
      ),
    );
  }
}
