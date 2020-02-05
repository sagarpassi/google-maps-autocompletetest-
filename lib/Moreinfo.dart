import 'package:flutter/material.dart';
import 'Constant.dart';
import 'finalpage.dart';
import 'maps.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColour = Color.fromRGBO(41, 171, 226, 1);
const activeCardColour = Colors.blue;
const inactiveCardColour = Colors.blueGrey;

class AddMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loco'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'First Name'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Second Name'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter Your Email'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                          onChanged: (value) {},
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Phone Number'),
                          keyboardType: TextInputType.number),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (finalpage())));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'SUBMIT',
                    style: Klargebutton,
                  ),
                ),
                color: bottomContainerColour,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 20.0),
                width: double.infinity,
                height: bottomContainerHeight,
              ),
            )
          ],
        ),
      ),
    );
  }
}
