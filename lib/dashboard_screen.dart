import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
//Indiactes the overall views in the screen
      body: Center(
        child: Column(
          //set the alignment full view from center
          mainAxisAlignment: MainAxisAlignment.center,
          //It conatins the views
          children: <Widget>[
            Text(
              'Welcome to the Dashboard Screen',
            ),
          ],
        ),
      ),
    );
  }
}
