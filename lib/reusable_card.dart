import 'package:flutter/material.dart';

class Reusable_card  extends StatelessWidget {
  // const Reusable_card ({Key? key}) : super(key: key); This is not important

  Reusable_card({required this.colour, this.content,this.onPress});

  //this is constructor which is use in the above code for customize colour and texts...
 final Color colour;
 final Widget ? content;
 final VoidCallback ? onPress;  //here is function is replce by voidcallback....
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
          onTap: onPress,
          child: Container(
            child: content,
            decoration: BoxDecoration(
                color: colour,
                borderRadius: BorderRadius.circular(10.0)),
            height: 200.0,
            width: 180.0,
            margin: EdgeInsets.all(8.0),
          ),
        );
  }
}
