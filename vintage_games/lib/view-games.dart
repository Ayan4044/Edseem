import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewGames extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewGamesState();
    
  }
}

class ViewGamesState extends State<ViewGames> {
 TextEditingController editingController = TextEditingController();
final duplicateItems = List<String>.generate(10000, (i) => "Game collection $i");
  var gameItems = [];

 @override
  void initState() {
    gameItems.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        gameItems.clear();
        gameItems.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        gameItems.clear();
        gameItems.addAll(duplicateItems);
      });
    }

  }


  @override
  Widget build(BuildContext context) {
  
  
    return Scaffold(
      body: CustomScrollView(
        physics: PageScrollPhysics(),
        slivers: [
          SliverAppBar(
              title: Text('Vintage Games'),
           
              floating: false,
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                   
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white70),
                    labelText: "Search Collection",
                    hintText: "FPS Games",
                   hintStyle: TextStyle( color: Colors.white60),
                    prefixIcon: Icon(Icons.search, color: Colors.white,),
                    focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
               borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white60, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))), 
                        ),
              ),
            ),
                        ],
                      ),
                    )
                  ],
                ),
              )),

          
         
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                 
                  child: Center(
                    child: Text('${gameItems[index]}', textScaleFactor: 3),
                  ),
                );
              },
              childCount: gameItems.length,
            ),
          ),
        ],
      ),
     
    );
  }
    
  
}
