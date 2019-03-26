import 'package:flutter/material.dart';
import './showtasks.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> tasks = [];

  @override
  void initState() {
    _getvalues();
    print(tasks);
    showtasks(tasks, _deletetask);
    super.initState();
  }

  void _addTask(String task) {
    setState(() {
      _setvalues(tasks);
      tasks.add(task);     
    });
  }

  void _deletetask(String task) {
    setState(() {
      tasks.remove(task);
      _setvalues(tasks);
    });
  }

  // @override
  // void initState() {
  //   tasks = _getTaskList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // _addTask();
          final String currentTeam = await _asyncInputDialog(context);
          print("Current team name is $currentTeam");
          if (currentTeam != "") _addTask(currentTeam);
          _setvalues(tasks);
        },
      ),
      body: showtasks(tasks, _deletetask),
    );
  }

  Future <bool> _setvalues(List <String> tasks) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList('key645', tasks);
  }

  Future <List<String> > _getvalues () async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List <String> dummytask;
    tasks += prefs.getStringList('key645');
  }
  
}