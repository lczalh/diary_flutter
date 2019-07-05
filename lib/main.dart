import 'dart:core';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'HomePage/HomePageWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'mian',
      home: MainEntranceWidget(),
    );
  }


}

// 
class MainEntranceWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainEntranceWidgetState();
  }
}

class MainEntranceWidgetState extends State<MainEntranceWidget> {
  // 选中的索引
  int _selectedIndex = 0;
  List<Widget> widgets = [HomePageWidget(),HomePageWidget()];

  @override
  Widget build(BuildContext context) {
    print(widgets.length);
    // TODO: implement build
    return new Scaffold(
      body: widgets[_selectedIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home
            ),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mic_none
            ),
            title: Text('我的'),
            // activeIcon: Icon(
            //   Icons.school
            // ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}