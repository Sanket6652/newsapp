import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/news_model.dart';
import '../widgets/news_card.dart';
import 'new_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<News> news = [];

  Future getNews() async {
    // var response = await http.get(Uri.http("newsdata.io", "/api/1/news", {
    //   "apikey": "pub_27271a20ee177b7b57442dc64baaaa5a6f6bf",
    //   "q": "cryptocurrency"
    // }));
    // https://newsdata.io/api/1/news?apikey=pub_27271a20ee177b7b57442dc64baaaa5a6f6bf&q=cryptocurrency

    //  var response = await http.get(Uri.http("newsapi.org", "/v2/top-headlines", {
    //   "country": "us",
    //   "category":"business",
    //   "apiKey": "39b8e801a03d43cdbf070a6fba0c1d13"
    // }));
    //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=39b8e801a03d43cdbf070a6fba0c1d13
    var response = await http.get(Uri.http("newsapi.org", "/v2/everything", {
      "q": "tesla",
      "from": "2023-07-06",
      "sortBy": "publishedAt",
      "apiKey": "39b8e801a03d43cdbf070a6fba0c1d13"
    }));
    //https://newsapi.org/v2/everything?q=tesla&from=2023-07-06&sortBy=publishedAt&apiKey=39b8e801a03d43cdbf070a6fba0c1d13
    var jsonData = jsonDecode(response.body);
    for (var eachItem in jsonData['articles']) {
      final lnew = News(
          description: eachItem['description'],
          title: eachItem['title'],
          urlToImage: eachItem['urlToImage'],
          author: eachItem['author'],
          publishedAt: eachItem['publishedAt'],
          content:eachItem['content'],
          url: eachItem['url']);

      news.add(lnew);
    }
  }

  void extractdate() {}

  @override
  Widget build(BuildContext context) {
    getNews();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fluttter News"),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: getNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsScreen(
                                      content: news[index].content,
                                      title: news[index].title,
                                      urlToImage: news[index].urlToImage,
                                      description: news[index].description, 
                                      url: news[index].url
                                    )));
                      },
                      child: mycard(
                          description: news[index].description,
                          title: (news[index].title),
                          urlToImage: news[index].urlToImage,
                          author: news[index].author,
                          publishedAt:
                              news[index].publishedAt.substring(0, 10)),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
