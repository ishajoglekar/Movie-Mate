import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'movie_details.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

// class VideoDemo extends StatefulWidget {
//   @override
//   VideoDemoState createState() => VideoDemoState();
// }

// class VideoDemoState extends State<VideoDemo> {
//   VideoPlayerController _controller;
//   Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     // _controller = VideoPlayerController.network(
//     // "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
//     _controller = VideoPlayerController.asset("videplayback.mp4");
//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
//     _controller.setVolume(1.0);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class HomeState extends State<Home> {
  var movies, latest_movies, topTV, popularTV;
  Color mainColor = Colors.orange;

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  get floatingActionButton => null;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    // _controller = VideoPlayerController.asset("videoplayback.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void getData() async {
    var data = await getJson();

    setState(() {
      movies = data['results'];
    });
  }

  void getLatestData() async {
    var data = await getLatestJson();

    setState(() {
      latest_movies = data['results'];
    });
  }

  void getTopRatedTVData() async {
    var data = await getTopRatedTVJson();

    setState(() {
      topTV = data['results'];
    });
  }

  void getPopularTVData() async {
    var data = await getPopularTVJson();

    setState(() {
      popularTV = data['results'];
    });
  }

  var image_url1 = 'https://image.tmdb.org/t/p/w500/';
  @override
  Widget build(BuildContext context) {
    getData();
    getLatestData();
    getTopRatedTVData();
    getPopularTVData();
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: new AppBar(
          elevation: 0.3,
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: new InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: new Icon(
              Icons.menu,
              color: mainColor,
            ),
          ),
          title: new Text(
            'Movie Mate',
            style: new TextStyle(
                color: mainColor,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
        ),
        body: new Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            // shrinkWrap: true,
            // padding: EdgeInsets.all(15.0),
            children: <Widget>[
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {
              //     setState(() {
              //       if (_controller.value.isPlaying) {
              //         _controller.pause();
              //       } else {
              //         _controller.play();
              //       }
              //     });
              //   },
              //   child:
              //   Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
              // ),

              new Text(
                'Top Releases',
                style: new TextStyle(
                    fontSize: 20.0,
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
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
                        color: Colors.black,
                      );
                    }),
              ),

              new Text(
                'Upcoming Releases',
                style: new TextStyle(
                    fontSize: 20.0,
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
                textAlign: TextAlign.left,
              ),
              new Expanded(
                child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      return new FlatButton(
                        child: new HomeMovieCell(latest_movies, i),
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () {
                          Navigator.push(context,
                              new MaterialPageRoute(builder: (context) {
                            return new MovieDetail(latest_movies[i]);
                          }));
                        },
                        color: Colors.black,
                      );
                    }),
              ),

              new Text(
                'Top Rated Series',
                style: new TextStyle(
                    fontSize: 20.0,
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
                textAlign: TextAlign.left,
              ),
              new Expanded(
                child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      return new FlatButton(
                        child: new HomeMovieCell(topTV, i),
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () {
                          Navigator.push(context,
                              new MaterialPageRoute(builder: (context) {
                            return new MovieDetail(topTV[i]);
                          }));
                        },
                        color: Colors.black,
                      );
                    }),
              ),

              new Text(
                'Popular TV Series',
                style: new TextStyle(
                    fontSize: 20.0,
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
                textAlign: TextAlign.left,
              ),
              new Expanded(
                child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      return new FlatButton(
                        child: new HomeMovieCell(popularTV, i),
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () {
                          Navigator.push(context,
                              new MaterialPageRoute(builder: (context) {
                            return new MovieDetail(popularTV[i]);
                          }));
                        },
                        color: Colors.black,
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

Future<Map> getLatestJson() async {
  var url =
      // 'https://api.themoviedb.org/3/movie/top_rated?api_key=45bf6592c14a965b33549f4cc7e6c664';
      'http://api.themoviedb.org/3/movie/upcoming?api_key=45bf6592c14a965b33549f4cc7e6c664&append_to_response=videos';

  // http://api.themoviedb.org/3/movie/131634?api_key=45bf6592c14a965b33549f4cc7e6c664&append_to_response=videos
  var response = await http.get(url);
  return json.decode(response.body);
}

Future<Map> getTopRatedTVJson() async {
  var url =
      // 'https://api.themoviedb.org/3/movie/top_rated?api_key=45bf6592c14a965b33549f4cc7e6c664';
      'http://api.themoviedb.org/3/tv/top_rated?api_key=45bf6592c14a965b33549f4cc7e6c664&append_to_response=videos';

  // http://api.themoviedb.org/3/movie/131634?api_key=45bf6592c14a965b33549f4cc7e6c664&append_to_response=videos
  var response = await http.get(url);
  return json.decode(response.body);
}

Future<Map> getPopularTVJson() async {
  var url =
      // 'https://api.themoviedb.org/3/movie/top_rated?api_key=45bf6592c14a965b33549f4cc7e6c664';
      'http://api.themoviedb.org/3/tv/popular?api_key=45bf6592c14a965b33549f4cc7e6c664';

  // http://api.themoviedb.org/3/movie/131634?api_key=45bf6592c14a965b33549f4cc7e6c664&append_to_response=videos
  var response = await http.get(url);
  return json.decode(response.body);
}

class HomeMovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = Colors.orange;
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
                margin: const EdgeInsets.all(6.0),
//                                child: new Image.network(image_url+movies[i]['poster_path'],width: 100.0,height: 100.0),
                child: new Container(
                  width: 100.0,
                  height: 130.0,
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
          height: 0.2,
          color: Colors.black,
          margin: const EdgeInsets.all(10.0),
        )
      ],
    );
  }
}
