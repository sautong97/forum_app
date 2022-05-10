import 'package:flutter/material.dart';
import 'package:forum_app/Helper/api_helper.dart';
import 'package:forum_app/Model/post_model.dart';

class PostList with ChangeNotifier {
  List<Post> posts = [];

  PostList() {
    initPosts();
  }

  Future<void> initPosts() async {
    List<dynamic> postsJson = await APIHelper.get("https://jsonplaceholder.typicode.com/posts");
    posts = postsJson.map((x) => Post.fromJson(x)).toList();
    notifyListeners();
    return;
  }
}
