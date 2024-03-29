import 'dart:convert';

import 'package:blogapp/Architectureprofile/constants.dart';
import 'package:blogapp/LoadingScreen/loading.dart';
import 'package:blogapp/LoadingScreen/loading2.dart';
import 'package:blogapp/LoadingScreen/loading3.dart';
import 'package:blogapp/Search/HomeScreen.dart';
import 'package:translator/translator.dart';
import 'package:blogapp/Forum/Forumcategory.dart';
import 'package:blogapp/Information/infoui.dart';
import 'package:blogapp/Screen/Navbar/expertlist.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:blogapp/checkout/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'Navbar/Architectlist.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    fetchPosts();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  GoogleTranslator translator =
      new GoogleTranslator(); //using google translator

  Translation out;
  var index=0;
  String txt = "Product";

  //getting text

  void trans() {
    translator.translate(txt, to: 'en') //translating to hi = hindi
        .then((output) {
      setState(() {
        txt =
            output.text; //placing the translated text to the String to be used
      });
      print(out);
    });
  }

  final url = "https://mongoapi3.herokuapp.com/delivery";
  var _imagesJson = [];

  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _imagesJson = jsonData;
      });
    } catch (err) {}
  }

  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(),
      body: RefreshIndicator(
        onRefresh: refreshList,
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Container(
              child: CarouselSlider.builder(
                itemCount: _imagesJson.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIdx) {

                 if(_imagesJson != null &&_imagesJson.length > index){
                   final post = _imagesJson[index];
                   return Container(
                     width: 300.0,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       image: DecorationImage(
                         image: post!=null?NetworkImage("${post['name']}"):Image.asset('assets/31.png'),
                         fit: BoxFit.cover,
                       ),
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         Expanded(
                           child: Text(
                             '${post['type']}',
                             style: TextStyle(
                               color: Colors.white,
                               fontFamily: 'Indies',
                               fontWeight: FontWeight.bold,
                               fontSize: 30.0,
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Text(
                             '${post['contact']}',
                             style: TextStyle(
                               fontFamily: 'Indies',
                               color: Colors.blue,
                               fontSize: 15.0,
                             ),
                             textAlign: TextAlign.center,
                           ),
                         ),
                       ],
                     ),
                   );
                 } else{
                   return SizedBox.shrink();
                 }},),),
            SizedBox(height: 10.0),
            GestureDetector(
              child: Container(
                height: 120.0,
        /*        decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.lightGreenAccent,
                      Colors.lightGreen,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),*/
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 5.0,
                      ),
                      Image.asset(
                        'assets/flowers2.png',
                        width: 150.0,
                        height: 150.0,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 70.0,
                      ),
                      Container(
                        child: Text("Products",
                            style:
                                TextStyle(color: Colors.black, fontSize: 30)),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Searchitems()));
              },
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              child: Container(
                height: 120.0,
               /* decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.lightGreenAccent,
                      Colors.lightGreen,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),*/
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                        },
                        blendMode: BlendMode.dstIn,
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset('assets/about.jpg',
                              fit: BoxFit.fill, width: 150.0, height: 150.0),
                        ),
                      ),

                      SizedBox(
                        width: 70.0,
                      ),
                      Container(
                        child: Text('Garden',
                            style:
                                TextStyle(color: Colors.black, fontSize: 30)),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Loading3()));
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              child: Container(
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: index.isEven ? kBlueColor : kSecondaryColor,
                  boxShadow: [kDefaultShadow],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('assets/forum.png',
                          fit: BoxFit.contain, width: 150.0, height: 150.0),
                      SizedBox(
                        width: 70.0,
                      ),
                      Container(
                        child: Text('Forum',
                            style:
                                TextStyle(color: Colors.green, fontSize: 30)),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loading2()));
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
                child: Container(
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.green,
                        Colors.lightGreenAccent,
                        Colors.lightGreen,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        Image.asset('assets/expert.png',
                            fit: BoxFit.contain, width: 150.0, height: 150.0),
                        SizedBox(
                          width: 50.0,
                        ),
                        Container(
                          child: Text('Experts',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 30)),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Loading()));
                }),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              child: Container(
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.lightGreenAccent,
                      Colors.lightGreen,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 5,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('assets/welcome.jpg',
                            fit: BoxFit.contain, width: 150.0, height: 150.0),
                        Container(
                          child: Text('Information',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 30)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(_createRoute());
              },
            ),
          ],
        ),
      ),

    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Categorylist(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return child;
      },
    );
  }
}
