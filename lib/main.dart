import 'dart:ui' as ui;
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'naver-map',
      (int viewId) => IFrameElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..src = 'assets/map.html'
        ..style.border = 'none',
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('네이버 지도 API'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: HtmlElementView(viewType: 'naver-map'),
        ),
      ),
    );
  }
}
