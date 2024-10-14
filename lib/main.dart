import 'package:flutter/material.dart';
import 'package:worldtime/Loading.dart';
import 'package:worldtime/choose_Location.dart';
import 'package:worldtime/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => const Loading(),
      "/choose_Location": (context) => const Choose_Location(),
      "/home": (context) => const Home()
    },
  ));
}
