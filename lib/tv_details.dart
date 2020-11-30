import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TVDetails extends StatelessWidget {
  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  TVDetails(this.movie);
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(fit: StackFit.expand, children: [
        new BackdropFilter(
          filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: new Container(
            color: Colors.black.withOpacity(1),
          ),
        ),
        new SingleChildScrollView(
          child: new Container(
            margin: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  child: new Container(
                    width: 400.0,
                    height: 400.0,
                  ),
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      image: new DecorationImage(
                        image:
                            new NetworkImage(image_url + movie['poster_path']),
                      ),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black,
                            blurRadius: 0.0,
                            offset: new Offset(0.0, 10.0))
                      ]),
                ),
                new Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 0.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Text(
                        movie['name'],
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'Arvo'),
                      )),
                      new Text(
                        '${movie['vote_average']}/10',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Arvo'),
                      )
                    ],
                  ),
                ),
                new Text(movie['overview'],
                    style:
                        new TextStyle(color: Colors.white, fontFamily: 'Arvo')),
                new Padding(padding: const EdgeInsets.all(50.0)),
                new Text('Rate this Series :',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontFamily: 'Arvo',
                    )),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new Row(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 0)),
                    new SizedBox(
                      height: 100,
                    ),
                    new Expanded(
                        child: new Container(
                      width: 50.0,
                      height: 100.0,
                      alignment: Alignment.center,
                      child: SmoothStarRating(
                          rating: 4,
                          isReadOnly: false,
                          size: 50,
                          color: Colors.yellow,
                          borderColor: Colors.yellow,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star_half,
                          defaultIconData: Icons.star_border,
                          starCount: 5,
                          allowHalfRating: true,
                          spacing: 2.0,
                          onRated: (value) {
                            print("rating value -> $value");
                            // print("rating value dd -> ${value.truncate()}");
                          }),
                      decoration: new BoxDecoration(
                          // new Text('Rate this series',
                          //     style: new TextStyle(
                          //         color: Colors.white, fontFamily: 'Arvo')),
                          borderRadius: new BorderRadius.circular(10.0),
                          color: const Color(0xaa3C3261)),
                    )),
                    // new Padding(
                    //   padding: const EdgeInsets.all(16.0),
                    //   child: new Container(
                    //     padding: const EdgeInsets.all(16.0),
                    //     alignment: Alignment.center,
                    //     child: new InkWell(
                    //       child: new Icon(
                    //         Icons.star,
                    //         color: Colors.yellow,
                    //       ),
                    //     ),
                    //     decoration: new BoxDecoration(
                    //         borderRadius: new BorderRadius.circular(10.0),
                    //         color: const Color(0xaa3C3261)),
                    //   ),
                    // ),
                    // new Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: new Container(
                    //       padding: const EdgeInsets.all(16.0),
                    //       alignment: Alignment.center,
                    //       child: new Icon(
                    //         Icons.check,
                    //         color: Colors.green,
                    //       ),
                    //       decoration: new BoxDecoration(
                    //           borderRadius: new BorderRadius.circular(10.0),
                    //           color: const Color(0xaa3C3261)),
                    //     )),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
