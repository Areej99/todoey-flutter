import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/task_widget.dart';
import 'data.dart';
import 'tasks_screen.dart';
class SlidingWindow extends StatefulWidget {
  @override
  _SlidingWindowState createState() => _SlidingWindowState();
}

class _SlidingWindowState extends State<SlidingWindow> {
  final taskController = TextEditingController();
  String newTaskText;
  List<TaskWidget> tasks = [];
  void addNewTask(String task) {
    TaskWidget newTask = TaskWidget(
      taskText: task,
      checked: false,
    );
    setState(() {
      //tasks.add(newTask);

      //taskNumber++;
    });
    Provider.of<Data>(context).addToList(newTask);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Add Task',
          style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        Container(
          width: 230,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.lightBlueAccent, width: 5),
              ),
            ),
            textAlign: TextAlign.center,
            maxLength: 25,
            style: TextStyle(color: Colors.blue, fontSize: 15),
            controller: taskController,
            onChanged: (value) {
              newTaskText = value;
            },
          ),
        ),
        Container(
          width: 230,
          height: 35,
          child: FlatButton(
            textColor: Colors.white,
            child: Text(
              'Add',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              taskController.clear();

             addNewTask(newTaskText);
              Navigator.pop(context,newTaskText);

              ////////////////////add task//----------------------------------------------------------------------------------------------------
            },
            color: Colors.lightBlueAccent,
          ),
        )
      ],
    );
  }
}
