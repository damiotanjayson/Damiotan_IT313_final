import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:peracon_final/dashboard.dart';

class Result extends StatefulWidget {
  final String fromCurr;
  final String toCurr;
  final String initialValue;

  Result(this.fromCurr, this.toCurr, this.initialValue);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String finalValue = "0";
  List<String> currencies;

  void initState() {
    super.initState();
    _doConversion();
  }

  Future<String> _doConversion() async {
    String from = widget.fromCurr;
    String to = widget.toCurr;
    String uri =
        "https://api.exchangeratesapi.io/latest?base=$from&symbols=$to";
    var response = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    setState(() {
      finalValue =
          (double.parse(widget.initialValue) * responseBody['rates'][to])
              .toString();
    });
    print(responseBody['rates'][to]);
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: (SingleChildScrollView(
                child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Color(0xFF010a43),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
              child: Align(
                alignment: FractionalOffset.topLeft,
                child: Text(
                  "The conversion is",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Align(
                  alignment: FractionalOffset.center,
                  child: AutoSizeText(
                    finalValue,
                    style: TextStyle(fontSize: 80, color: Colors.white),
                    maxLines: 1,
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 5, 30, 20),
              child: Align(
                alignment: FractionalOffset.center,
                child: Text(
                  widget.toCurr,
                  style: TextStyle(color: Color(0xFFfb4953), fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Color(0xFFff2e63),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
                child: Text(
                  'Another Transaction',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    )))));
  } //Widget Build
}
//State
