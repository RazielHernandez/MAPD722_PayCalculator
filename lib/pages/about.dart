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
        Text('Student name: Carlos Hernandez'),
        Divider(),
        Text('Student number: 301290263'),
        Divider(),
      ],
    );
  }
}