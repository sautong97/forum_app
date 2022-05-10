import 'package:flutter/material.dart';
import 'package:forum_app/Provider/post_list.dart';
import 'package:forum_app/post_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<PostList>(create: (_) => PostList())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: 'Forum App'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
      ),
      body: Center(child: PostListScreen()),
    );
  }
}
