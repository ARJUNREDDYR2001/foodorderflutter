// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, prefer_final_fields, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'food_list.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/foodList': (context) => FoodListPage(),
        
      },
    );
  }
}



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> imageUrls = [
    'assets/biriyani.jpeg',
    'assets/rice.jpg',
    'assets/ragiball.jpg',
    'assets/Idli.jpg',
    'assets/Dosa.jpg',
    'assets/fishfry.jpg',
    'assets/Chow-Chow-Bath-Recipe.jpg',
    'assets/mushroomrice.jpg',
    'assets/gobi.jpg',
    'assets/poori.jpeg',
  ];

  int _currentIndex = 0;
  int _colorIndex = 0;
  List<Color> colorList = [
    Color.fromARGB(255, 25, 231, 28),
    Colors.red,
    Color.fromARGB(255, 20, 207, 220),
    // Add more colors as needed
  ];

  late Timer _timer;
  late Timer _colorTimer;

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _startTimer();
    _startColorTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentIndex < imageUrls.length - 1) {
        _pageController.nextPage(
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  void _startColorTimer() {
    _colorTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _colorIndex = (_colorIndex + 1) % colorList.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _colorTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color.fromARGB(255, 229, 186, 14),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "Welcome to NMIT food!",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: colorList[_colorIndex],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Laughter is brightest where food is best",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 17, 52, 194),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      imageUrls[index],
                      fit: BoxFit.cover,
                    );
                  },
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/foodList');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 29, 194, 17),
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 25,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Click Here to Order",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
