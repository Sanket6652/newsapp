import 'package:flutter/material.dart';

class mycard extends StatelessWidget {
  mycard(
      {super.key,
      required this.description,
      required this.title,
      required this.urlToImage,
      required this.author,
      required this.publishedAt});
  late String title;
  late String description;
  late String urlToImage;
  late String author;
  late String publishedAt;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25), // Customize border radius
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Image.network(
                  urlToImage, // Replace with your image URL
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                  width: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(publishedAt,style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(width: 5,),
                    Text("author : " + author,style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
