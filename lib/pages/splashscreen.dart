
// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todoit/pages/home.dart';
import 'package:todoit/utilities/color.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
     Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.primaryColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("lib/assets/logo.json",
              width: 200, height: 200, fit: BoxFit.fill),
          const SizedBox(
            height: 15,
          ),
          Text(
            'TO DO IT !',
            textAlign: TextAlign.center,
            style: GoogleFonts.rowdies(
                fontSize: 30,
                color: color.secondaryTextColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          if (defaultTargetPlatform == TargetPlatform.iOS)
            const CupertinoActivityIndicator(
              color: color.secondaryTextColor,
              radius: 20,
            )
          else
            const CircularProgressIndicator(
              color: color.secondaryTextColor,
            )
        ],
      )),
    );
  }
}
