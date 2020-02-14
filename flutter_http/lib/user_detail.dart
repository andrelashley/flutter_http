import 'package:flutter_http/http_service.dart';
import 'package:flutter_http/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http/users_model.dart';

class UserDetail extends StatelessWidget {
  final User user;
  final HttpService httpService = HttpService();

  UserDetail({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await httpService.deletePost(user.id);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text("Name"),
              subtitle: Text(user.name),
            ),
            ListTile(
              title: Text("Email"),
              subtitle: Text(user.email),
            ),
            ListTile(
              title: Text("Phone"),
              subtitle: Text(user.phone),
            ),
          ],
        ),
      )),
    );
  }
}
