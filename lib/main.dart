// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoit/pages/splashscreen.dart';

void main() async{

  //init hive local database
  await Hive.initFlutter();

  //ouvrir une boîte de données
  var bax = await Hive.openBox('TODOBOX');

 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'TodoIt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
