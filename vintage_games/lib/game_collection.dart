import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:like_button/like_button.dart';

import 'model/pixibaymode.dart';

class GameCollection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GameCollectionState();
  }
}

class GameCollectionState extends State<GameCollection> {
  bool loader = false;
  List<String> names = [];
  List<Hits> pixibayModelList = [];

  @override
  void initState() {
    _loadResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Vintage Games"),
      ),
      body: loader
          ? Center(
              child: Container(
                child: GridView.builder(
                  itemCount: pixibayModelList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ImageAsset(pixibayModelList[index]);
                  },
                ),
              ),
            )
          : Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }

  Widget ImageAsset(imageData) {
    return Card(
      semanticContainer: true,
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 85,

            child: Image.network(
              imageData.userImageURL,
              fit: BoxFit.fitWidth,
            ),
          ),
          LikeButton(),
        ],
      ),
    );
  }

  Future<void> _loadResults() async {
    // Define some headers and query parameters

    //encode Map to JSON
    Map<String, String> queryParameters = {
      "key": '18112703-f6a2ee52f2f97171550896f49',
      "q": 'games',
      "image_type": 'photo',
      "pretty": 'true'
    };

    var uri = Uri.https("pixabay.com", '/api/', queryParameters);
    debugPrint("Url $uri");
    final response = await http.post(uri);
    setState(() {});
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      loader = true;
      if (responseBody['totalHits'] > 0) {
        pixibayModelList = responseBody['hits']
            .map<Hits>((item) => Hits.fromJson(item))
            .toList();
      }
      debugPrint("JSON Body= " + response.body);
    }
  }
}
