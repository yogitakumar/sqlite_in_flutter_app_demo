import 'package:flutter/material.dart';
import 'package:sqliteinflutterappdemo/utils/database.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  Map<String, String> newUser ={};
  late Future _userFuture;

  @override
  void initState(){
    super.initState();
    _userFuture=getUser();
  }

  getUser() async{
    final _userData = await DBProvider.db.getUser();
    return _userData;
  }

  var _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COUNTER PAGE"),
      ),
      body: FutureBuilder(
        future:_userFuture,
        builder: (_,userData){
          switch (userData.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.done:
              if(!newUser.containsKey('username')){
                newUser=Map<String,String>.from(userData.data);
              }
              return Column(
                children: [
                  Text(newUser["username"]),
                  Text(newUser["password"])
                ],
              )
          }
        },
      )
    );
  }
}
