//Animation Bottom  Navigations(amime4.dart)
//widgets that use
//BottomNavagations
//Expende
//InkWell
//AnimatedSwitcher
//SlideTrangations

import 'package:appp/Screen/Animated/anima3.dart';
import 'package:flutter/material.dart';

import '../Animations/Animationone/animated1.dart';
import '../Animations/animated5.dart';

//
//function retun type widgets
//this is the function showan screen on body
_getPages(int? page) {
  debugPrint(page.toString());
  switch (page) {
    case 0:
      return AnimatedListOne();
    case 1:
      return AnimationOnePage();

    case 2:
      return AnimationBottomRevel();
  }
}

//main widgets Class
class AnimatiedBottonNavagation extends StatefulWidget {
  final String title;
  const AnimatiedBottonNavagation({super.key, required this.title});

  @override
  State<AnimatiedBottonNavagation> createState() =>
      _AnimatiedBottonNavagationState();
}

class _AnimatiedBottonNavagationState extends State<AnimatiedBottonNavagation> {
  int _currentPages = 0;

  @override
  void initState() {
    // TODO: implement initState
    _currentPages = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: "openSans"),
        ),
      ),
      // body: pages[_currentPages],
      body: _getPages(_currentPages),
      bottomNavigationBar: AnimationBottonNav(
        currentIndex: _currentPages,
        onChange: (index) {
          setState(() {
            _currentPages = index;
          });
        },
      ),
    );
  }
}

//AnimationButtonNav

class AnimationBottonNav extends StatelessWidget {
  final int? currentIndex;
  final Function(int)? onChange;
  AnimationBottonNav({super.key, this.currentIndex, this.onChange});

  //hook area
  @override
  Widget build(BuildContext context) {
    return Container(
        height: kToolbarHeight,
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () => onChange!(0),
              child: BottomNavItems(
                title: "home",
                icon: Icons.home,
                isActive: currentIndex == 0,
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () => onChange!(1),
              child: BottomNavItems(
                title: "Hero",
                icon: Icons.animation,
                isActive: currentIndex == 1,
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () => onChange!(2),
              child: BottomNavItems(
                title: "BottomR",
                icon: Icons.menu,
                isActive: currentIndex == 2,
              ),
            )),
          ],
        ));
  }
}

//BottomNavItems

class BottomNavItems extends StatelessWidget {
  final bool isActive;
  final Color? activeColor;
  final Color? inActiveColor;
  final String? title;
  final IconData? icon;
  BottomNavItems(
      {super.key,
      this.isActive = false,
      this.title,
      this.activeColor,
      this.inActiveColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 200),
      transitionBuilder: ((child, animation) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
                  .animate(animation),
          child: child,
        );
      }),
      child: isActive
          ? Container(
              color: Colors.white,
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                        color: inActiveColor ?? Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    width: 7.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            )
          : Icon(
              icon,
              color: inActiveColor ?? Color.fromARGB(255, 239, 6, 119),
            ),
    );
  }
}
