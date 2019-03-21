import 'package:flutter/material.dart';
import './taskmanager.dart';
import './showtasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TO_DO_TO'),
        ),
        body: taskManager(),
      ),
    );
  }
}
