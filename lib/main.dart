import 'package:bottom_navigation/screens/favorite.dart';
import 'package:bottom_navigation/screens/home.dart';
import 'package:bottom_navigation/screens/profile.dart';
import 'package:bottom_navigation/screens/search.dart';
import 'package:bottom_navigation/screens/settings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 2;

  final screens = const [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  final items = const [
    Icon(Icons.home, size: 30),
    Icon(Icons.search, size: 30),
    Icon(Icons.favorite_sharp, size: 30),
    Icon(Icons.settings, size: 30),
    Icon(Icons.person, size: 30),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Column(
          children: [
            Text(
              'Curved Navigation Bar',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'pouya.code',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        index: index,
        height: 60,
        items: items,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
