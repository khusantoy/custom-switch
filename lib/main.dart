import 'dart:math';

import 'package:custom_switch/carousel_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CarouselCard(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          color: isOn ? Colors.blue : Colors.black87,
          duration: const Duration(milliseconds: 500),
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 250,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: isOn ? Colors.blue.shade300 : Colors.black,
                image: DecorationImage(
                  repeat: ImageRepeat.repeatX,
                  alignment: Alignment.centerRight,
                  image:
                      AssetImage(isOn ? "assets/sky.png" : "assets/road.jpg"),
                ),
              ),
              child: AnimatedAlign(
                alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
                duration: const Duration(milliseconds: 300),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isOn = !isOn;
                    });
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          left: isOn ? 200 : 30,
                          top: 25,
                          duration: const Duration(milliseconds: 500),
                          child: Transform.rotate(
                            angle: 90 * pi / 180,
                            child: const Icon(
                              Icons.airplanemode_on,
                              size: 70,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          left: isOn ? 30 : -100,
                          top: 25,
                          duration: const Duration(milliseconds: 500),
                          child: Transform.rotate(
                            angle: 90 * pi / 180,
                            child: const Icon(
                              Icons.airplanemode_on,
                              color: Colors.blue,
                              size: 70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
