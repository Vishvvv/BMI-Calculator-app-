import 'package:flutter/material.dart';
import 'constants.dart';

// const labelText = TextStyle(fontSize: 20.0,color: Colors.grey);
// this line goes to constants.dart

Column Iconcontent(String gender,IconData iconData) {
  return Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(iconData,size: 80.0,color: Colors.white,),
      SizedBox(height: 12.0,),
      Text(gender,style: labelText)
    ],);
}
