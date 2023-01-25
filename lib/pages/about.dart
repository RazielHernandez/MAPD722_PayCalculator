import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  /*const ColumnWidget({
    Key key,
  }) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(10.0)),
        Text('Developed by:', style: TextStyle(fontSize: 25)),
        Divider(),
        Text('Student name: Carlos Hernandez'),
        Text('Student number: 301290263'),
        Divider(),
      ],
    );
  }
}