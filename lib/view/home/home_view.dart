import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  HomeView() {
    print('bleo: homeview init');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
