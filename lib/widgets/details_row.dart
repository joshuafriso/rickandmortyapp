import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  final String type;
  final String desc;

  DetailsRow(this.type, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(type.toUpperCase()),
          Flexible(
              child: Text(
            desc,
            style: TextStyle(color: Colors.orange, fontSize: 16.0),
          )),
        ],
      ),
    );
  }
}
