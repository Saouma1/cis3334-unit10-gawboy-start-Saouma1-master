import 'dart:ui';
import 'package:cis3334_unit10_gawboy/load_painting_info.dart';
import 'package:flutter/material.dart';
import 'painting_info.dart';

void main() {
  runApp(MyApp()); // Entry point of the application.
}

class MyApp extends StatelessWidget {
  // MyApp is the root widget of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // The title of the application.
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'XKCD Comic List'), // Home page of the app.
    );
  }
}

class MyHomePage extends StatefulWidget {
  // StatefulWidget allows for dynamic content, as painting data may change.
  const MyHomePage({super.key, required this.title});
  final String title; // Title for the home page.

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController ctrl = PageController(); // Controller for PageView.
  List<PaintingInfo> gawboyPaintings = []; // List to hold paintings information.

  @override
  void initState() {
    super.initState();
    LoadPaintingInfo paintLoader = LoadPaintingInfo();
    gawboyPaintings = paintLoader.InitInCode(); // Initialize painting data on startup.
  }

  @override
  Widget build(BuildContext context) {
    // Builds the visual structure of the page.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Displays the title on the app bar.
      ),
      body: PageView.builder(
        controller: ctrl, // Controls the page view.
        itemCount: gawboyPaintings.length, // Number of pages in the PageView.
        itemBuilder: (BuildContext context, int position) {
          return buildPaintingPage(position); // Builds each page.
        },
      ),
    );
  }

  Widget buildPaintingPage(int position) {
    // Helper method to build each painting page.
    return Column(
      children: <Widget>[
        Image.asset('assets/images/' + gawboyPaintings[position].imageFile), // Display painting image.
        Text(gawboyPaintings[position].name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), // Display painting name.
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(gawboyPaintings[position].gawboyDescription), // Display painting description.
        ),
      ],
    );
  }
}
