import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'data.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  TaskWidget({this.taskText, this.checked});
  final taskText;
  bool showRow = true;
  bool checked;

  //final checked;
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return (widget.showRow)
        ? Container(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
                onLongPress: () {
                  Provider.of<Data>(context).decreament();
                  setState(() {
                    widget.showRow = false;
                  });
                },
                onTap: () {
                  setState(() {
                    widget.checked = !widget.checked;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.taskText,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          decoration: widget.checked
                              ? TextDecoration.lineThrough
                              : null,
                          fontFamily: 'IndieFlower'),
                    ),
                    Icon(
                      !widget.checked
                          ? Icons.check_box_outline_blank
                          : Icons.check_box,
                      color: Colors.black54,
                      size: 25,
                    )
                  ],
                )))
        : Container();
  }
}
