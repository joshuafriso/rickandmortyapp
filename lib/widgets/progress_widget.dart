import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final bool isLoading;
  
  ProgressWidget(this.isLoading);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.green),
          ),
        ),
      ),
    );
  }
}