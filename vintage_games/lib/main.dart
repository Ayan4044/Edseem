import 'package:flutter/material.dart';
import 'package:vintage_games/view-games.dart';

import 'game_collection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var containerColor = Colors.blue.shade400;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Vintage Games",
        home: GameCollection());

    throw UnimplementedError();
  }

  Widget _gridView() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(50),
          child:
              const Text("Collection 1", style: TextStyle(color: Colors.white)),
          color: containerColor,
        ),
        Container(
          padding: const EdgeInsets.all(50),
          child:
              const Text('Collection 2', style: TextStyle(color: Colors.white)),
          color: containerColor,
        ),
        Container(
          padding: const EdgeInsets.all(50),
          child: const Text('Collection 3', style: TextStyle(color: Colors.white)),
          color: containerColor,
        ),
        Container(
          padding: const EdgeInsets.all(50),
          child: const Text('Collection 4', style: TextStyle(color: Colors.white)),
          color: containerColor,
        ),
        Container(
          padding: const EdgeInsets.all(50),
          child: const Text('Collection 5', style: TextStyle(color: Colors.white)),
          color: containerColor,
        ),
        Container(
          padding: const EdgeInsets.all(50),
          child: const Text('Collection 6', style: TextStyle(color: Colors.white)),
          color: containerColor,
        ),
      ],
    );
  }
}
