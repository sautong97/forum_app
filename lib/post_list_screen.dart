import 'package:flutter/material.dart';
import 'package:forum_app/Provider/post_list.dart';
import 'package:provider/provider.dart';

import 'posts_details_screen.dart';

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final posts = context.watch<PostList>().posts;
    return ListView.builder(
      itemBuilder: (BuildContext, index) {
        return Card(
          child: ListTile(
            title: Text(posts[index].title ?? ""),
            subtitle: Text(posts[index].body ?? ""),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostDetailsWrapper(postId: posts[index].id)),
              );
            },
          ),
        );
      },
      itemCount: posts.length,
      shrinkWrap: true,
      padding: EdgeInsets.all(5),
      scrollDirection: Axis.vertical,
    );
  }
}
