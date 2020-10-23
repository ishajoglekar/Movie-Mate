import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'movie_details.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  var movies;
  Color mainColor = const Color(0xff3C3261);

  void getData() async {
    var data = await getJson();

    setState(() {
      movies = data['results'];
    });
  }

  var image_url1 = 'https://image.tmdb.org/t/p/w500/';
  @override
  Widget build(BuildContext context) {
    getData();

    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          elevation: 0.3,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: new Icon(
            Icons.arrow_back,
            color: mainColor,
          ),
          title: new Text(
            'Movies',
            style: new TextStyle(
                color: mainColor,
                fontFamily: 'Arvo',
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            new Icon(
              Icons.menu,
              color: mainColor,
            )
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                'Latest Releases',
                style: new TextStyle(
                    fontSize: 20.0,
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arvo'),
                textAlign: TextAlign.left,
              ),
              new Expanded(
                child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      return new FlatButton(
                        child: new HomeMovieCell(movies, i),
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () {
                          Navigator.push(context,
                              new MaterialPageRoute(builder: (context) {
                            return new MovieDetail(movies[i]);
                          }));
                        },
                        color: Colors.white,
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

Future<Map> getJson() async {
  var url =
      // 'https://api.themoviedb.org/3/movie/top_rated?api_key=45bf6592c14a965b33549f4cc7e6c664';
      'http://api.themoviedb.org/3/movie/top_rated?api_key=45bf6592c14a965b33549f4cc7e6c664&append_to_response=videos';

  // http://api.themoviedb.org/3/movie/131634?api_key=45bf6592c14a965b33549f4cc7e6c664&append_to_response=videos
  var response = await http.get(url);
  return json.decode(response.body);
}

class HomeMovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  HomeMovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: const EdgeInsets.all(16.0),
//                                child: new Image.network(image_url+movies[i]['poster_path'],width: 100.0,height: 100.0),
                child: new Container(
                  width: 100.0,
                  height: 170.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(
                          image_url + movies[i]['poster_path']),
                      fit: BoxFit.cover),
                  boxShadow: [
                    new BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: new Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),
          ],
        ),
        new Container(
          width: 100.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
