import 'dart:convert';

import 'package:flutter/cupertino.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  late String username;
  late String password;

  User({this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        password: json["passsword"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
