import 'package:flutter/material.dart';
import 'package:forum_app/Model/comment_model.dart';
import 'package:forum_app/Model/post_model.dart';

import '../Helper/api_helper.dart';

class PostDetails with ChangeNotifier {
  Post? post;
  List<Comment> comments = [];

  PostDetails(id) {
    initPostDetails(id);
  }

  Future<void> initPostDetails(int id) async {
    dynamic postJson = await APIHelper.get("https://jsonplaceholder.typicode.com/posts/${id}");
    List<dynamic> commentsJson = await APIHelper.get("https://jsonplaceholder.typicode.com/comments?postId=${id}");
    post = Post.fromJson(postJson);
    comments = commentsJson.map((x) => Comment.fromJson(x)).toList();
    notifyListeners();
    return;
  }
}
