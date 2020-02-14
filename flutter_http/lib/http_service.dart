import 'dart:convert';
import 'package:flutter_http/posts_model.dart';
import 'package:flutter_http/users_model.dart';
import 'package:http/http.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";
  final String usersURL = "https://jsonplaceholder.typicode.com/users";

  Future<List<User>> getUsers() async {
    Response res = await get(usersURL);

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> users = body
        .map(
          (dynamic item) => User.fromJson(item),
      ).toList();

      return users;
    } else {
      throw "Can't get users.";
    }
  }

  Future<List<Post>> getPosts() async {
    Response res = await get(postsURL);

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
        .map(
          (dynamic item) => Post.fromJson(item),
      )
      .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<void> deletePost(int id) async {
    Response res = await delete("$postsURL/$id");

    if(res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Can't delete post.";
    }
  }
}