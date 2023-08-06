import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/news_model.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen(
      {super.key,
      required this.content,
      required this.title,
      required this.urlToImage,
      required this.description,
      required this.url});
  String title;
  String content;
  String urlToImage;
  String description;
  String url;

  void _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter News")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            GestureDetector(
              onTap: () {
                _launchURL();
              },
              child: const Text(
                "Click here to read Article",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              child: Text(content, style: const TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
