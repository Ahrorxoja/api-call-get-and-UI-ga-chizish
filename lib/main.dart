import 'package:fevral_1/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

String stringResponse = '';
Map mapResponse = {};
Map dataResponse = {};
String malimot = "malimot topilmadi";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        dataResponse = mapResponse['data'];
        print(stringResponse);
        print(dataResponse);
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("api Call"),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0), color: Colors.purple,
                // color: Colors.white,
              ),
              width: 300,
              height: 300,
              child: Center(
                child: Column(
                  children: [
                    dataResponse == null
                        ? Text("Data is loading...")
                        : Text(
                            dataResponse['email'],
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                    Text(
                      dataResponse['id'].toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      dataResponse['first_name'].toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    // Image.network(dataResponse['avatar']),
                    CircleAvatar(
                      radius: 45,
                      child: ClipOval(
                        child: Image.network(
                          dataResponse['avatar'],
                          // width: 250,
                          // height: 250,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Salom()),
                          );
                        },
                        child: Text('salom'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
