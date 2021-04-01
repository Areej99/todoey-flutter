import 'package:flutter/material.dart';
import 'package:todoey/task_widget.dart';
class Data extends ChangeNotifier{
  int number=0;
  List<TaskWidget> tasks = [];
  void increament(){
    number++;
    notifyListeners();

  }
  void decreament(){
    number--;
    notifyListeners();
  }

  void addToList( TaskWidget newTask){
    tasks.add(newTask);
    number++;
    notifyListeners();

  }
}