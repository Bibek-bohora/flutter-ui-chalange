//Animation List One (anim5.dart)
//widgets that use
//1AnimatedList
//2SideTransations
//3SizeTransations
//Tween

import 'package:flutter/material.dart';

//make your Own List
List<String> palces = [
  "1",
  "2",
  "3",
  "4",
  "5",
];

class AnimatedListOne extends StatefulWidget {
  const AnimatedListOne({super.key});

  @override
  State<AnimatedListOne> createState() => _AnimatedListOneState();
}

class _AnimatedListOneState extends State<AnimatedListOne> {
  late List<String> items;
  //declare Gloablekey in flutter
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  //makeing initial states
  void initState() {
    // main array
    items = [
      "A",
      "B",
      "C",
      "D",
      "E",
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
          key: _listKey,
          initialItemCount: items.length,
          itemBuilder: (context, index, anim) {
            return SlideTransition(
              position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                  .animate(anim),
              child: Container(
                color: Color.fromARGB(255, 205, 228, 206),
                margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                padding: EdgeInsets.all(0),
                child: ListTile(
                  title: Text(
                    items[index],
                    style: TextStyle(color: Color.fromARGB(255, 25, 24, 24)),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        _listKey.currentState?.removeItem(index,
                            (context, animation) {
                          String removedItem = items.removeAt(index);
                          return SizeTransition(
                              axis: Axis.vertical,
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 4.0,
                                    horizontal: 8.0,
                                  ),
                                  padding: const EdgeInsets.all(0),
                                  child: ListTile(
                                    title: Text(removedItem),
                                  )),
                              sizeFactor: animation);
                        });
                      },
                      icon: Icon(Icons.clear, color: Colors.red)),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            palces.shuffle();
            items.insert(items.length, palces[0]);
            _listKey.currentState!
                .insertItem(items.length - 1); //from whwre insert item
            setState(() {});
          }),
    );
  }
}
