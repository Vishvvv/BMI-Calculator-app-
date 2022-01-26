import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculator.dart';
class resultsPage extends StatelessWidget {
  resultsPage({this.bmiresult,this.getresult,this.feedback});

  final String ? bmiresult;
  final String ? getresult;
  final String ? feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('Results'), backgroundColor: Color(0xFF111328)),
        backgroundColor: Color(0xFF0A0E21),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your Result',
                    style: resultcontainer,
                  ),
                )),
            Expanded(
              flex: 3,
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //   Text('OVERWEIGHT',style: labelText,),
              //   Text('26.4',style: label1Text,),
              //   Text('You have a higher than a normal body weight.Try to exercise mpre',style: labelText,),
              // ],),
              // This method is also same as to reuusablecard

              child: Reusable_card(
                colour: Color(0xFF1D1E33),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      getresult.toString(),
                      style: resulttext,
                    ),
                    Text(
                      bmiresult.toString(),
                      style: BMItext,
                    ),
                    Text(
                      feedback.toString(),
                      style: suggestionText,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
        GestureDetector (
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Recalculate Your BMI',style: bottomtextstyle,),
              ]
            ),
            color: Color(0xFFEB1555),
            padding: EdgeInsets.only(top:4.0),
            width: double.infinity,
            // this width will automatic adjust acording to screen size..
            height: bottomcontainer,
            margin: EdgeInsets.only(top: 10.0),)
          ),

          ],
        ));
  }
}
