import 'package:flutter/material.dart';
import 'package:rickandmortyapp/pages/details_page.dart';
import 'package:rickandmortyapp/widgets/progress_widget.dart';

class ListWidget extends StatelessWidget {
  final ScrollController _scrollController;
  final List characteres;
  final bool isLoading;

  ListWidget(this._scrollController, this.characteres, this.isLoading);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: characteres.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == characteres.length) {
          return ProgressWidget(isLoading);
        } else
          return GestureDetector(
            child: ListTile(
              title: Text(characteres[index]["name"]),
              subtitle: Text('Status: ${characteres[index]["status"]}'),
              leading: Image.network(characteres[index]["image"]),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(characteres[index])));
            },
          );
      },
    );
  }
}