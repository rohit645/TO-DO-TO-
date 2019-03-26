import 'package:flutter/material.dart';

class detailsWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: Text('Description Window'),
      ),
      body: Column(
        children: <Widget>[
        ,
          RaisedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text('Go back'),
          )
        ],
      ),
    
    );
  }
}
