import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading;
  Dio dio;
  String firstPostTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _loadedData(),
              RaisedButton(
                onPressed: () {
                  _getData();
                },
                child: Text("Get Data"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadedData() {
    if (isLoading) {
      return CircularProgressIndicator();
    } else {
      return Text("$firstPostTitle");
    }
  }

  @override
  void initState() {
    dio = Dio();
    firstPostTitle = "press the button!";
    isLoading = false;
    super.initState();
  }

  _getData() async {
    setState(() {
      isLoading = true;
    });
    var response;

    try{

      response =
      await dio.get('https://jsonplaceholder.typicode.com/posts');

    }catch(e){
      print('-----Error----');
    }
    setState(() {
      firstPostTitle = response.data[0]['title'] as String;
      isLoading = false;
    });
  }
}
