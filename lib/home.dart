import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _loadedData(),
            RaisedButton(
              onPressed: () {},
              child: Text("Get Data"),
            )
          ],
        ),
      ),
    );
  }

  Widget _loadedData() {
    if (isLoading) {
      return CircularProgressIndicator();
    } else {
      return Text("Load Data");
    }
  }
}
