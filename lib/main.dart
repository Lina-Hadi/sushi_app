import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/pages/cart.dart';
import 'pages/intro.dart';
import 'pages/menu.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(),
  child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro': (context) => const IntroPage(),
        '/menu': (context) => const MenuPage(),
        '/cart': (context) => const Cart(),
      },
    );
  }
}
