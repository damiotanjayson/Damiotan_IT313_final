import 'package:flutter/material.dart';
import 'package:peracon_final/result.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static String from, to;
  String initialValue = "0";
  final TextEditingController quan = new TextEditingController();
  List<String> currencyName = [
    'CAD',
    'HKD',
    'ISK',
    'PHP',
    'DKK',
    'HUF',
    'CZK',
    'GBP',
    'RON',
    'SEK',
    'IDR',
    'INR',
    'BRL',
    'RUB',
    'HRK',
    'JPY',
    'THB',
    'CHF',
    'EUR',
    'MYR',
    'BGN',
    'TRY',
    'CNY',
    'NOK',
    'NZD',
    'ZAR',
    'USD',
    'MXN',
    'SGD',
    'AUD',
    'ILS',
    'KRW',
    'PLN',
  ];

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
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
              child: (Text(
                "Pera Converter",
                style: TextStyle(color: Colors.white, fontSize: 40),
              )),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: quan,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: initialValue,
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        initialValue = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: DropdownButton<String>(
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Color(0xFFffcc72),
                        ),
                        dropdownColor: Color(0xFF192259),
                        hint: Container(
                          alignment: Alignment.centerRight,
                          width: 96,
                          child: Text(from == null ? 'Base Currency' : from,
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                        value: from,
                        items: currencyName.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            from = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: DropdownButton<String>(
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Color(0xFF01cc88),
                        ),
                        dropdownColor: Color(0xFF192259),
                        hint: Container(
                          alignment: Alignment.centerRight,
                          width: 96,
                          child: Text(
                            to == null ? 'Desired Currency' : to,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        value: to,
                        items: currencyName.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            to = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: FlatButton(
                  color: Color(0xFFff2e63),
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(from, to, initialValue),
                      ),
                    );
                  },
                  child: Text(
                    'Convert',
                    style: TextStyle(fontSize: 20),
                  ),
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
