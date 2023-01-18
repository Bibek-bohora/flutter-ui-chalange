//Bottom Reavel animation(anim2.dart)
//Bottom BottomR

import 'package:bottomreveal/bottomreveal.dart';
import 'package:flutter/material.dart';

class AnimationBottomRevel extends StatefulWidget {
  const AnimationBottomRevel({super.key});

  @override
  State<AnimationBottomRevel> createState() => _AnimationBottomRevelState();
}

class _AnimationBottomRevelState extends State<AnimationBottomRevel> {
  final BottomRevealController _bottomRController = BottomRevealController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomReveal(
        openIcon: Icons.add,
        closeIcon: Icons.close,
        controller: _bottomRController,
        revealHeight: 100,
        revealWidth: 100,
        borderRadius: 20,
        bottomContent: _bottomMenu(),
        rightContent: _bottomRightMenu(),
        body: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: 20,
            itemBuilder: ((context, index) {
              return Card(
                color: Color.fromARGB(255, 241, 235, 235),
                child: ListTile(
                  leading: Icon(Icons.cloud_circle),
                  title: Text("Items $index"),
                ),
              );
            })),
      ),
    );
  }
}

Column _bottomRightMenu() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      MaterialButton(
        height: 60,
        minWidth: 60,
        textColor: Colors.white,
        color: Color(0xff644B77),
        padding: const EdgeInsets.all(0),
        onPressed: () {},
        child: Icon(
          Icons.video_call,
          size: 50,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      MaterialButton(
        height: 60,
        minWidth: 60,
        textColor: Colors.white,
        color: Color(0xff644B77),
        padding: const EdgeInsets.all(0),
        onPressed: () {},
        child: Icon(
          Icons.video_call,
          size: 50,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      MaterialButton(
        height: 60,
        minWidth: 60,
        textColor: Colors.white,
        color: Color(0xff644B77),
        padding: const EdgeInsets.all(0),
        onPressed: () {},
        child: Icon(
          Icons.video_call,
          size: 50,
        ),
      )
    ],
  );
}

TextField _bottomMenu() {
  return TextField(
    decoration: InputDecoration(
        filled: true,
        label: Text("enter value"),
        hintText: "helooo",
        border: OutlineInputBorder(
            gapPadding: 8.0,
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(30))),
  );
}
