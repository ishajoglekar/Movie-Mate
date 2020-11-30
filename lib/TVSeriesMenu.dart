import 'package:flutter/material.dart';
import 'package:movie_mate/tv.dart';
import 'package:movie_mate/welcomePage.dart';
import 'home.dart';
import 'loginPage.dart';
import 'signup.dart';
import 'package:google_fonts/google_fonts.dart';

class TVSeriesMenu extends StatefulWidget {
  TVSeriesMenu({Key key, this.title, this.active}) : super(key: key);

  final String title;
  final String active;

  @override
  _TVSeriesMenuState createState() => _TVSeriesMenuState();
}

class _TVSeriesMenuState extends State<TVSeriesMenu> {
  Widget _homeButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        child: Text(
          'Home',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _TVSeriesButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TVSeries()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(5)),
        //   border: Border.all(color: Colors.white, width: 2),
        // ),
        child: Text(
          'TV Series',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _moviesButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(5)),
        //   border: Border.all(color: Colors.white, width: 2),
        // ),
        child: Text(
          'Movies',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(5)),
        //   border: Border.all(color: Colors.white, width: 2),
        // ),
        child: Text(
          'Logout',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[],
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Movie',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'Mate',
              style: TextStyle(color: Colors.orange, fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 80,
              ),
              _homeButton(),
              SizedBox(
                height: 20,
              ),
              _TVSeriesButton(),
              SizedBox(
                height: 20,
              ),
              _moviesButton(),
              SizedBox(
                height: 20,
              ),
              _logoutButton(),
              SizedBox(
                height: 20,
              ),
              _label()
            ],
          ),
        ),
      ),
    );
  }
}
