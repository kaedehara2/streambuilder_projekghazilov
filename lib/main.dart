import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream #Putradamaskus',
      theme: ThemeData(
        primarySwatch: Colors.cyan, // ✅ Perbaikan dari cyanAccent
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  late Stream<int> numberStreamInstance; // ✅ Ganti nama variabel

  @override
  void initState() {
    numberStreamInstance = NumberStream().getNumbers(); // ✅ Ganti variabel
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream PutraDamaskus'),
      ),
      body: StreamBuilder(
        stream: numberStreamInstance,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error!',
                style: TextStyle(fontSize: 95, color: Colors.red),
              ),
            );
          }

          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 95),
              ),
            );
          } else {
            return const  SizedBox.shrink();
          }
        },
      ),
    );
  }
}
