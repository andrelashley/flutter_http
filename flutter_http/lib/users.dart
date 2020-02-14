import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http/http_service.dart';
import 'package:flutter_http/post_detail.dart';
import 'package:flutter_http/posts_model.dart';
import 'package:flutter_http/user_detail.dart';
import 'package:flutter_http/users_model.dart';

class UsersPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Directory"),
      ),
      body: FutureBuilder(
        future: httpService.getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            List<User> users = snapshot.data;
            return ListView(
              children: users.map(
                (User user) => ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserDetail(user: user),
                  )),
                ),
              ).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
