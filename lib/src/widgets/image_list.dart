import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage((images[index]));
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Image.network(image.url),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(image.title),
            )
          ],
        ),
        decoration:
            BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
            ));
  }

}
