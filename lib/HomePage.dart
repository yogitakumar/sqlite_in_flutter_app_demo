import 'package:flutter/material.dart';
import 'package:sqliteinflutterappdemo/utils/database.dart';

import 'models/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var username;
  var password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
      ),
      body:Center(
        child:Container(
          child:Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
               Container(
                 child:Padding(
                   padding: const EdgeInsets.only(bottom:50.0),
                   child: Column(
                     children: [
                       Text("Username"),
                       TextField(
                         onChanged: (value){
                           setState(() {
                             username = value;
                           });
                         },
                       )
                     ],
                   ),
                 )
               ),
                Container(
                    child:Padding(
                      padding: const EdgeInsets.only(bottom:50.0),
                      child: Column(
                        children: [
                          Text("Password"),
                          TextField(
                            onChanged: (value){
                              setState(() {
                                password = value;
                              });
                            },
                          )
                        ],
                      ),
                    )
                ),
                Container(
                  child: MaterialButton(
                    child: Text("SAVE"),
                    onPressed: () {
                      var newDBUser = User(username: username, password: password);
                          DBProvider.db.newUser(newDBUser);
                    }
                  )
                )
              ],
            ),
          )
        )
      )
    );
  }
}
