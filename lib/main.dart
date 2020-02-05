import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuable_card.dart';
import 'Moreinfo.dart';
import 'Constant.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColour = Color.fromRGBO(41, 171, 226, 1);
const activeCardColour = Colors.blue;
const inactiveCardColour = Colors.blueGrey;

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
      } else {
        maleCardColour = inactiveCardColour;
      }
    }
    if (gender == 2) {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }

  String buttonBar = "Occupation";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        //appBar: AppBar(
        //title: Text('LOCUMOTIVE'),
        // elevation: 6,
        // ),
        body: Column(
          children: <Widget>[
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColour(1);
                        });
                      },
                      child: ReusableCard(
                        colour: maleCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColour(2);
                        });
                      },
                      child: ReusableCard(
                        colour: femaleCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: FractionallySizedBox(
                    alignment: Alignment.center,
                    widthFactor: 0.9,
                    heightFactor: 0.7,
                    child: FlatButton(
                      color: Colors.greenAccent,
                      child: Text(buttonBar, style: Kdropbutton),
                      onPressed: () {
                        final act = CupertinoActionSheet(
                          message: Text('Please Select One'),
                          actions: <Widget>[
                            CupertinoActionSheetAction(
                              child: Text('Optometrist'),
                              onPressed: () {
                                print('Optometrist');
                                setState(() {
                                  buttonBar = 'Optometrist';
                                });

                                Navigator.pop(context);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: Text('Contact Lens Optometrist'),
                              onPressed: () {
                                print('selected this');
                                setState(() {
                                  buttonBar = 'Contact Lens Optometrist';
                                });
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: Text('Dispensing Optometrist'),
                              onPressed: () {
                                print('Dispensing Optometrist');
                                setState(() {
                                  buttonBar = 'Dispensing Optometrist';
                                });
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: Text('Lab Technicians'),
                              onPressed: () {
                                print('selected this');
                                setState(() {
                                  buttonBar = 'Lab Technicians';
                                });
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: Text('Audiologist'),
                              onPressed: () {
                                print('selected this');
                                setState(() {
                                  buttonBar = 'Audiologist';
                                });

                                Navigator.pop(context);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: Text('Hard Care Dispenser'),
                              onPressed: () {
                                print('selected this');
                                setState(() {
                                  buttonBar = 'Hard Care Dispenser';
                                });

                                Navigator.pop(context);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: Text('Store Owner'),
                              onPressed: () {
                                print('selected this');
                                Navigator.pop(context);
                                setState(() {
                                  buttonBar = 'Store Owner';
                                });
                              },
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: Text('Cancle'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            isDestructiveAction: true,
                          ),
                        );
                        showCupertinoModalPopup(
                            context: context, builder: (BuildContext) => act);
                      },
                    ),
                  ),
                )),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddMore()));
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
        ));
  }
}
