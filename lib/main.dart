import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobsheet6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<Map<String, String>> mahasiswa = [
    {'nama': 'Revaldo Novandhika', 'nim': 'STI202102353'},
    {'nama': 'Wahyu triyono', 'nim': 'STI202102355'},
    {'nama': 'Julia Kurnia Mubarokah', 'nim': 'STI202102363'},
    {'nama': 'Amin Suratun Khasanah', 'nim': 'STI202102368'},
    {'nama': 'Alfiami Sholihatun', 'nim': 'STI202102373'},
  ];

  static const List<Color> textColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

  static const Duration timerDuration = Duration(seconds: 2);

  int currentIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(timerDuration, (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % mahasiswa.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
      ),
      body: Center(
        child: Container(
          color: Colors.white, 
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mahasiswa[currentIndex]['nama']!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColors[currentIndex % textColors.length],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                mahasiswa[currentIndex]['nim']!,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
