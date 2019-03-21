import 'package:flutter/material.dart';

class showtasks extends StatelessWidget {
  List<String> tasks;
  final Function deleteTask;
  showtasks(this.tasks, this.deleteTask);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: tasks
            .map((ele) => Card(
                  child: ListTile(
                    title: Text(ele),
                    // leading: Text('data1'),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.cancel,
                      ),
                      onPressed: () {
                        deleteTask(ele);
                      },
                    ),
                  ),
                ))
            .toList());
  }
}
