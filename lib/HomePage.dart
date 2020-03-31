import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _username = new TextEditingController();

   String link = "https://api.github.com/users/" ;
   

  List data;
  var isLoading = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   this._getUser();
    
  // }
  String user = null;
  var dataToJson;
  Future<String> _getUser(String text) async {

    user = text;
    _username.clear();
    String url = "https://api.github.com/users/" + text;

    var response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"}

    );
    print(url);
    setState(() {
     dataToJson = json.decode(response.body);
     data = dataToJson;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("github"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _username,
            ),
            RaisedButton(
              onPressed: () =>_getUser(_username.text),
              child: Text("Hey"),
            ),
            ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context,int index){
                return Card(
                  child: Column(
                    children: <Widget>[
                      Text('hiii'),
                     // Text(data[index]['name']),
                    ],
                  ),
                );
              },
            )
            //Text(dataToJson['name']),
            //Text(data['name']),
          ],
        ),        
      ),
      
      
    );
  }
}