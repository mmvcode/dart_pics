class ImageModel {
  late int id;
  late String url;
  late String title;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    url = jsonData['url'];
    title = jsonData['title'];
  }
}
