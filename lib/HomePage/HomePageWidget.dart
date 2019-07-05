import 'dart:core';
import 'dart:core';
import 'dart:core' as prefix2;
import 'dart:ui';
import 'dart:ui';
import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePageWidget extends StatefulWidget {
  @override
  HomePageWidgetState createState() => HomePageWidgetState();
}

class HomePageWidgetState extends State<HomePageWidget> {
  // 分组标题
  List<String> SectionTitles = ['生活服务,休闲娱乐'];
  List lists = [
    {
      'title': '生活服务',
      'rows': [
        {
          'title': '快递',
          'icon': 'assets/images/xingqiu.png'
        },
        {
          'title': '新闻',
          'icon': 'assets/images/xingqiu.png'
        },
      ]
    },
    {
      'title': '休闲娱乐',
      'rows': [
        {
          'title': '电影',
          'icon': 'assets/images/xingqiu.png'
        },
      ]
    }
  ];
  // 分组widget
  List<Widget> sectionWidgets = [];
  // 行widget
  List rowWidgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < lists.length; i++) {
      List<Widget> rows = [];
      Map listMap = lists[i];
      for (var x = 0; x < listMap['rows'].length; x++) {
        Map rowMap = listMap['rows'][x];
        rows.add(createRowWidget(rowMap['icon'],rowMap['title'],i,x));
      }
      rowWidgets.add(rows);
      sectionWidgets.add(createWidget(listMap['title'], i));
    }

    // for (Map listMap in lists) {
    //   sectionWidgets.add(createWidget(listMap['title']));
    //   for (Map rowMap in listMap['rows']) {
    //     rowWidgets.add(createRowWidget(rowMap['icon'],rowMap['title'],0));
    //   }
    // }

    // sectionWidgets.add(createWidget('生活服务'));
    // sectionWidgets.add(createWidget('休闲娱乐'));

    // rowWidgets.add(createRowWidget('assets/images/xingqiu.png','快递',0));
    
  }

  @override
  Widget build(BuildContext context) {
    //rowWidgets.add(createWidget());
    // 状态栏高度
    double _statusBarHeight = MediaQuery.of(context).padding.top;
    // 用于获得 是iphone X 则tabbar距离的底部差34。 否则距离0
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return new MaterialApp(
      title: '我的',
      home: new Scaffold(
        appBar: new CupertinoNavigationBar(
          middle: Text("首页"),
        ),
        body: new Column(
          children: <Widget>[
            Container(
              height: 180,
              width: window.physicalSize.width,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    'assets/images/1.jpg',
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 3,
                pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.red, activeColor: Colors.blue)),
                autoplay: true,
                //viewportFraction: 0.1,
                //scale: 0.7,
              ),
            ),
            Expanded(
              child: ListView(
                children: sectionWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 创建自定义分组widget
  Widget createWidget(String title, int sectionIndex) {
    return Column(
      children: <Widget>[
        Container(
          width: window.physicalSize.width,
          height: 40,
          child: Text(title),
        ),
        Row(
          children: rowWidgets[sectionIndex],
        )
      ],
    );
  }

  /* 创建自定义行Widget
  * imagePath： 图片路径/地址
  * title：标题
  * sectionIndex：分组索引
  * rowIndex：行索引
  */
  Widget createRowWidget(String imagePath, String title, int sectionIndex, int rowIndex) {
    return GestureDetector(
      child: Container(
        width: 80,
        height: 80,
        child: Column(
          children: <Widget>[
            Image.asset(imagePath),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        print(1234);
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(widget.title),
//       ),
//       body: new Swiper(
//         itemBuilder: (BuildContext context, int index) {
//           return new Image.network(
//             "http://via.placeholder.com/350x150",
//             fit: BoxFit.fill,
//           );
//         },
//         itemCount: 3,
//         pagination: new SwiperPagination(),
//         control: new SwiperControl(),
//       ),
//     );
//   }
// }
