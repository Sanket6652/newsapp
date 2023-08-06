import 'package:flutter/material.dart';

class News {
  String title;
  String description;
  String urlToImage;
  String author;
  String publishedAt;
  String content;
  String url;
  News(
      {required this.description,
      required this.title,
      required this.urlToImage,
      required this.author,
      required this.publishedAt,
      required this.content,
      required this.url});
}
