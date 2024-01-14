import 'package:assignment_5_3/cart_details.dart';
import 'package:assignment_5_3/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:assignment_5_3/favorite_screen.dart';
import 'package:assignment_5_3/home_screen.dart';
import 'package:assignment_5_3/profile_screen.dart';
import 'package:provider/provider.dart';

import 'favorite_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)=>MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> FavoriteProvider()),
      ChangeNotifierProvider(create: (_)=> CartProvider())
    ],
  
  child: MaterialApp(
    title: 'E-store',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorSchemeSeed: Colors.blue,
      scaffoldBackgroundColor: Colors.grey,
    ),
    home: const MyHomePage(),
  ),
  );
  }


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List screens = const [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Store"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>const CartDetails(),)
          ), icon: const Icon(Icons.add_shopping_cart_rounded)),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() => currentIndex = value);
        },
        selectedItemColor: const Color.fromARGB(255, 55, 134, 200),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}