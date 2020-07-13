import 'dart:io';

import 'package:flukan/api/version.dart';
import 'package:flutter/material.dart';

void main() {
  stdout.writeln('Run MyApp()');
  runApp(FlukanApp());
}

class FlukanApp extends StatefulWidget {
  FlukanApp({Key key}) : super(key: key);

  @override
  _FlukanAppState createState() => _FlukanAppState();
}

class _FlukanAppState extends State<FlukanApp> {
  Future<Version> futureVersion;

  @override
  void initState() {
    super.initState();
    futureVersion = getVersion();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hokan UI Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hokan UI Example'),
        ),
        body: Center(
          child: FutureBuilder<Version>(
            future: futureVersion,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("v" + snapshot.data.version);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
