import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart';
import 'package:todoey/sliding_window.dart';
import 'task_widget.dart';
import 'data.dart';

// ignore: must_be_immutable
class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final taskController = TextEditingController();


  @override
  Widget build(BuildContext context) {

     var myProvider =Provider.of<Data>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSlideDialog(
            context: context,
            child: Flexible(
              fit: FlexFit.loose,
              child: SlidingWindow(),
            ),
            barrierColor: Colors.white.withOpacity(0.7),
            pillColor: Colors.white,
            backgroundColor: Colors.white,
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        //padding:
        //EdgeInsets.only(bottom: 30.0, top: 60.0, left: 40.0, right: 30.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, top: 50, right: 30, bottom: 10),
              child: CircleAvatar(
                child: Icon(
                  Icons.list,
                  size: 35,
                ),
                backgroundColor: Colors.white,
                radius: 30,
              ),
            ),
            SizedBox(
              height: 20,
              //width: 40,
            ),
            SizedBox(
              width: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, top: 0, right: 30, bottom: 10),
              child: Text(
                'Todoey',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, top: 0, right: 30, bottom: 50),
              child: Text(
                '${myProvider.number} Tasks', ////-------------------------------------------
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(0.0),
                  ),
                ),
                child: ListView.builder(
                  itemCount: myProvider.tasks.length,
                  itemBuilder: (context, index) {
                    final task = myProvider.tasks[index]; //final is a compile time const
                    return Container(
                      child: task,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
