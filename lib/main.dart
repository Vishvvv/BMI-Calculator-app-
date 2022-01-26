import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/iconcontent.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/results.dart';
import 'package:bmi_calculator/roundiconbutton.dart';
import 'calculator.dart';

// const bottomcontainer = 88.0;
// const activecolor = Color(0xFF1D1E33);
// const inactivecolor= Color(0xFF111328);
// enum Zender {male,female}
// these are goes to constants.dart

void main() => runApp(Bmi_Calculator());

class Bmi_Calculator extends StatelessWidget {
  const Bmi_Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bmi_Calculator',
      //  theme: ThemeData.dark(),  this is for dark theme in app
      theme: ThemeData(
          // primaryColor: Colors.lightBlueAccent,  by this color change only in appbar,bottombar
          primaryColor: Color(0xFF0A0E21),
          accentColor: Color(0xFF111328),
          // accentcolor uses for color of floatingActionButton
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

@override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Zender ? selectedzender;
int height = 180;
int weight = 70;
int age = 19;
  // Color malecard = inactivecolor;  // color is data type tbhi to malecard m color assign kr payenge
  // Color femalecard = inactivecolor;

  //    updatecolor(Zender zender) {
  //   // 1 for male and 2 for female
  //   setState(() {
  //     if (zender == Zender.male) {
  //       if (malecard == inactivecolor) {
  //         malecard = activecolor;
  //         femalecard = inactivecolor;
  //       }
  //       else
  //         {malecard = inactivecolor;}
  //     }
  //     if (zender == Zender.male) {
  //       if (femalecard == inactivecolor) {
  //         femalecard = activecolor;
  //         malecard = inactivecolor;
  //       }
  //       else
  //         {femalecard = inactivecolor;}
  //     }
  //   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI   CALCULATOR',
            // style:
            // TextStyle(fontWeight: FontWeight.bold,letterSpacing: 10.0,),
          ),
        ),
        body: // Container(
            //   // color: Color(0xFF1D1E33), This color property can't use here when decoration proprty is used
            //   // so this color proprty goes to decoration proprty
            //   decoration: BoxDecoration(color: Color(0xFF1D1E33), borderRadius: BorderRadius.circular(10.0)),
            //   height: 200.0,
            //   width: 180.0,
            //  margin: EdgeInsets.all(8.0),

            Container(
                child: Column(
          children: [
            Expanded(
                child: Row(children: [
              Expanded(
                child: Reusable_card(
                  onPress: (){setState(() {
                  selectedzender = Zender.male;

                });},
                  colour: selectedzender == inactivecolor?activecolor:inactivecolor,
                  content: Iconcontent("MALE", FontAwesomeIcons.mars),
                ),
              ),
              Expanded(child:
              Reusable_card(
              onPress: (){setState(() {
              selectedzender = Zender.female;
              });},
                colour: selectedzender==inactivecolor?activecolor:inactivecolor,
                content: Iconcontent(
                  'FEMALE',
                  FontAwesomeIcons.venus,
                ),
              ),)
            ])),
            //The value of this colour is transfered to parameter in constructor then further transfered to color property of Reusablecard
                   Expanded(
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
              Reusable_card(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text('Height',style: labelText),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,// it is for cm placed at baseline
                        textBaseline: TextBaseline.alphabetic, // it is compulsory when we use crossaxisalignment.baseline
                        children: [
                        Text(height.toString(),
                            // height is integer but Text accepts string then I will convert into String
                            style: label1Text),
                        Text('cm',style: labelText,)
                      ],),
                       SliderTheme(
                         data: SliderTheme.of(context).copyWith(
                           thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                           overlayShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                           overlayColor: Color(0x29EB1555),
                         ),
                         child:
                         Slider(value: height.toDouble(),
                            min: 120.00,
                            max: 220.00,
                            thumbColor: Colors.pinkAccent,
                            activeColor: Colors.white,
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newvalue){
                             setState(() {
                               height = newvalue.round();
                             });
                            }
                            ),
                       )
                  ],
                ),
                colour: activecolor,
              )
            ]),
                   ),
            Expanded(
                child: Row(children: [
              Reusable_card(
                colour: activecolor,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT',style: labelText,),
                    Text(weight.toString(),style: label1Text,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                      // FloatingActionButton(
                      //     backgroundColor: Color(0xFF4C4F5E),
                      //     onPressed: (){
                      //   setState(() {
                      //     weight++;
                      //   });
                      // },child: Icon(FontAwesomeIcons.plus,color: Colors.white,size: 20.0,)
                      // ),
                        Roundiconbutton(icon: FontAwesomeIcons.plus,
                                        pressed: (){
                          setState(() {
                            weight++;
                          });
                                        },),
                      SizedBox(width: 20.0,),
                      //   FloatingActionButton(
                      //       backgroundColor: Color(0xFF4C4F5E),
                      //       onPressed: (){
                      //   setState(() {
                      //     weight--;
                      //   });
                      // },child: Icon(FontAwesomeIcons.minus,color: Colors.white,size: 20.0,)),
                        Roundiconbutton(icon:FontAwesomeIcons.minus,
                                              pressed: (){
                          setState(() {
                            weight--;
                          });
                                              },)
                    ],)
                  ],
                ),
              ),
              Reusable_card(
                colour: activecolor,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Age',style: labelText,),
                  Text(age.toString(),style: label1Text,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Roundiconbutton(icon: FontAwesomeIcons.plus,
                                    pressed: (){
                                          setState(() {
                                            age++;
                                          });
                                    }),
                    SizedBox(width: 20.0,),
                    Roundiconbutton(icon: FontAwesomeIcons.minus,
                                     pressed: (){
                                       setState(() {
                                         age--;
                                       });
                                     })
                  ],)
                ],
                ),
              )
            ])),
    GestureDetector (
    onTap: (){
      setState(()
      {
        Calculator calc = Calculator(height: height, weight: weight);
        String bmicalculator = calc.bmicalculator();
       Navigator.push(context, MaterialPageRoute(builder: (context)=>resultsPage(bmiresult: bmicalculator,getresult: calc.getresult(),feedback: calc.feedback(),)
       )
       );
      });
    },
    child: Container(
    child: Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('Calculate Your BMI'.toString(),style: bottomtextstyle,),
    // if .tostring is not applied then thow an error.....
    ],
    ),
    color: Color(0xFFEB1555),
    padding: EdgeInsets.only(top:4.0),
    width: double.infinity,
    // this width will automatic adjust acording to screen size..
    height: bottomcontainer,
    margin: EdgeInsets.only(top: 10.0),
    ),
    ),
    ],
        ))
    );
  }
}
// ===================================== bottomButton ======================================
//       ============================================== bottomButton =========================
// ================================= iconcontent ===================================
//                                                 ICON CONTENT
// ================================= reusable card ++++++++++++++++++++++++++++++++
//                                                 Reusable card
// ==================================== RoundIconbutton ==============================
// =====================================             roundiconbutton     ==============