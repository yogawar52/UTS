import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

String baliImage = "assets/Bali.jpg";
String bandungImage = "assets/Bandung.jpg";
String jakartaImage = "assets/Jakarta.jpg";
String jogjaImage = "assets/Jogja.jpg";

var gambar = [baliImage, bandungImage, jakartaImage, jogjaImage];

class PageHome extends StatefulWidget {
  final String nama;
  final String password;
  final String email;

  PageHome({
    Key key,
    @required this.nama,
    @required this.email,
    @required this.password,
  }) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Home'),
        backgroundColor: Color(0xFF222838),
      ),
      body: ListView(
        children: <Widget>[
          Text('Welcome, ${widget.nama} <${widget.email}>'),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Travel",
                    style: TextStyle(color: Color(0xFF222838), fontSize: 24.0)),
                SizedBox(height: 8.0),
                Container(
                  color: Color(0xFF272c3d),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 8.0,
                      ),
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Cari Tempat Wisata",
                              hintStyle: TextStyle(color: Colors.white54),
                              border: InputBorder.none),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 32.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Destinasi",
                  style: TextStyle(
                      color: Color(0xFF222838),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
                CarouselSlider(
                  height: 200.0,
                  items: gambar.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Image.asset(i, fit: BoxFit.cover),

                          // child: Text(
                          //   'text $i',
                          //   style: TextStyle(fontSize: 16.0),
                          // ),
                        );
                      },
                    );
                  }).toList(),
                  autoPlay: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final nama;
  final warna;
  GradientButton(this.nama, this.warna);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(nama,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
