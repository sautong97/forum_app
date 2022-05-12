import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'Provider/post_details.dart';

class PostDetailsWrapper extends StatelessWidget {
  final int postId;

  const PostDetailsWrapper({Key? key, required this.postId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => PostDetails(postId), child: PostDetailsScreen());
  }
}

class PostDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postDetails = context.watch<PostDetails>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Text(
                      postDetails.post?.title ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(postDetails.post?.body ?? "")
                  ],
                ),
              ),
              TextField(
                onChanged: (text) => postDetails.filterPost(text),
              ),
              Text(
                "Comments",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext, index) {
                    return Card(
                      child: ListTile(
                        title: Text(postDetails.comments[index].name ?? ""),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postDetails.comments[index].email ?? "",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(postDetails.comments[index].body ?? "")
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: postDetails.comments.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
