import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final bool isLoading;
  
  ProgressWidget(this.isLoading);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.green),
          ),
        ),
      ),
    );
  }
}