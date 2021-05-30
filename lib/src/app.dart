// 1. import flutter helper lib
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

// 2. Create custom widget class, which must extend 'StatelessWidget' class
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];
  // 3. Define build method that returns the widget that *this* widget will show
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Let\'s see Images!'),
      ),
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.add),
      ),
    ));
  }

  void fetchImage() async {
    counter++;
    final baseUrl = 'https://jsonplaceholder.typicode.com/photos/$counter';
    final response = await get(Uri.parse(baseUrl));
    final jsonData = json.decode(response.body);
    final image = ImageModel.fromJson(jsonData);

    setState(() {
      images.add(image);
    });
  }
}
