import 'package:flutter/material.dart';
import 'placepage.dart'; // Import PlacesPage for navigation

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light; // Default theme is light

  void _toggleTheme(bool isDarkTheme) {
    setState(() {
      _themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: _themeMode, // Switch between dark and light mode
      initialRoute: '/places', // Initial route set to the PlacesPage
      routes: {
        '/places': (context) => PlacesPage(onThemeChanged: _toggleTheme),
      },
    );
  }
}
