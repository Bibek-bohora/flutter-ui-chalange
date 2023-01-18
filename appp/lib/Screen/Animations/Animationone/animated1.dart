//Hero Animations(anima3.dart)
//widgets
//BottomNavigationBar
//BottomNavigationBarItem
//Text.rich ,TextSpan()
//Align
//Swipper from packeges
//Hero for animat

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'details.dart';
import 'images_net.dart';

List<String> images = [
  'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media',
  'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F2.jpg?alt=media',
  'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media',
];

const List<Map> dummy = [
  {"title": "paints", "price": "\$400"},
  {"title": "leather Bags", "price": "\$510"},
  {"title": "Beutiful T-shirts", "price": "\$620"}
];

class AnimationOnePage extends StatefulWidget {
  const AnimationOnePage({super.key});

  @override
  State<AnimationOnePage> createState() => _AnimationOnePageState();
}

class _AnimationOnePageState extends State<AnimationOnePage>
    with SingleTickerProviderStateMixin {
//hook area
  int currentIndex = 0;
  int previousIndex = 0;
  final SwiperController _swipperController = SwiperController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (() {}),
            ),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: "Bext Item ",
                style: TextStyle(
                    fontSize: 17.0,
                    inherit: true,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat")),
            TextSpan(
                text: "from arround",
                style: TextStyle(
                    fontSize: 17.0,
                    inherit: true,
                    color: Color.fromARGB(255, 8, 160, 236),
                    fontFamily: "Pacifico"))
          ])),
          Expanded(
              flex: 2,
              child: Swiper(
                loop: false,
                itemCount: 3,
                viewportFraction: 0.8,
                pagination: SwiperPagination(
                    margin: EdgeInsets.only(top: 20),
                    builder: DotSwiperPaginationBuilder(
                        activeColor: Color.fromARGB(255, 254, 4, 17),
                        activeSize: 16)),
                onIndexChanged: ((index) {
                  _animationController.reverse();
                  setState(() {
                    previousIndex = currentIndex;
                    currentIndex = index;
                    _animationController.forward();
                  });
                }),
                physics: BouncingScrollPhysics(),
                controller: _swipperController,
                itemBuilder: ((context, index) {
                  return Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            HeroAnimationDetails(
                                              index: index,
                                            ))));
                              }),
                              child: Hero(
                                tag: "images$index",
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: PnImageNetwor(
                                    image: images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ));
                }),
              )),
          Stack(
            children: <Widget>[
              AnimatedOpacity(
                opacity: currentIndex == 0 ? 1 : 0,
                child: _buildDesc(0),
                duration: Duration(seconds: 1),
              ),
              AnimatedOpacity(
                opacity: currentIndex == 1 ? 1 : 0,
                child: _buildDesc(1),
                duration: Duration(seconds: 1),
              ),
              AnimatedOpacity(
                opacity: currentIndex == 2 ? 1 : 0,
                child: _buildDesc(2),
                duration: Duration(seconds: 1),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _buildDesc(int index) {
  return Container(
    width: double.infinity,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 10.0),
        Hero(
          tag: "title$index",
          child: Material(
            type: MaterialType.transparency,
            child: SizedBox(
              child: Text(
                dummy[index]["title"],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Hero(
          tag: "price$index",
          child: Material(
            type: MaterialType.transparency,
            child: SizedBox(
              child: Text(
                dummy[index]["price"],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    ),
  );
}
