import 'package:flutter/material.dart';
import './showtasks.dart';
import './inputalert.dart';

Future<String> _asyncInputDialog(BuildContext context) async {
  String teamName = '';
  return showDialog<String>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter New Task'),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Task Title', hintText: 'Meeting with boss'),
              onChanged: (value) {
                teamName = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(teamName);
            },
          ),
        ],
      );
    },
  );
}

class taskManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _taskManagerState();
  }
}

class _taskManagerState extends State<taskManager> {
  final List<String> tasks = [];

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
      // print(tasks);
    });
  }

  void _deletetask(String task) {
    setState(() {
      tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // _addTask();
          final String currentTeam = await _asyncInputDialog(context);
          print("Current team name is $currentTeam");
          _addTask(currentTeam);
        },
      ),
      body: showtasks(tasks,_deletetask),
    );
  }
}
