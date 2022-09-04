import 'package:flutter/material.dart';

import 'screens/navigation_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netflix UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black),
      //home: Splash(),
      initialRoute: '/',

      routes: {
        '/': (context) => const Splash(),
        '/users': (context) => const Users(),
        //'/NavScreen': (context) => NavScreen()
        '/HomeScreen': (context) => const NavScreen()
      },
    );
  }
}
