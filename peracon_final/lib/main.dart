import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:peracon_final/dashboard.dart';

void main() {
  runApp(new MaterialApp(
    home: MyHome(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/backgroundSplash.png',
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                )),
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomLeft,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 10, 3),
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: Color(0xFF17298e),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(80),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: FractionalOffset.topLeft,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: ColorizeAnimatedTextKit(
                        onTap: () {},
                        text: ['Convert Your Money Now'],
                        textStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                        colors: [
                          Colors.white,
                          Color(0xFFffcc72),
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.topLeft,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
                      child: Text(
                        'You have nothing to worry\nabout, we got you',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.topLeft,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          'Convert Now',
                          style: TextStyle(
                            color: Color(0xFF131F66),
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
