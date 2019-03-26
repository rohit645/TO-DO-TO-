import 'package:flutter/material.dart';

class showtasks extends StatelessWidget {
  List<String> tasks;
  final Function deleteTask, add_details;
  showtasks(this.tasks, this.deleteTask, this.add_details);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: tasks
            .map((ele) => Card(
                  child: ListTile(
                    onLongPress: () {
                      add_details();
                    },
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
