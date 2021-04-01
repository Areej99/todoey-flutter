import 'package:flutter/material.dart';
import 'tasks_screen.dart';
import 'package:provider/provider.dart';
import 'data.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      builder :(BuildContext context) => Data()  ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}


