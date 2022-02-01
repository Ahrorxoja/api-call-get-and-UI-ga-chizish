import 'package:fevral_1/main.dart';
import 'package:flutter/material.dart';

class Salom extends StatefulWidget {
  const Salom({Key? key}) : super(key: key);

  @override
  _SalomState createState() => _SalomState();
}

class _SalomState extends State<Salom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  dataResponse['id'].toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
