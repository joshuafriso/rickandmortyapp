import 'package:flutter/material.dart';
import 'package:rickandmortyapp/widgets/details_row.dart';

class DetailsPage extends StatelessWidget {
  final Map details;

  DetailsPage(this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          details["name"],
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black12),
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(details["image"]))),
                Flexible(
                  child: Text(
                    details["name"],
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                DetailsRow("Status", details["status"]),
                DetailsRow("Species", details["species"]),
                DetailsRow("Gender", details["gender"]),
                DetailsRow("Origin", details["origin"]["name"]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
