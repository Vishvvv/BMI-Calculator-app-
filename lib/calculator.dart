import 'dart:math';
import 'package:flutter/material.dart';
class Calculator{

  Calculator({required this.height,required this.weight});
  final int height;
  final int weight;
  // double ? bmi ;  if this statement also throws an error then use below statement.....
  var bmi;  // or use double bmi = 0;
  String bmicalculator(){
  bmi = weight/pow(height/100, 2);
  return bmi.toStringAsFixed(1);
  }
  String getresult(){
    if (bmi>=25){
      return 'overweight';
    }
    else if (bmi>18)
      return 'Normal';
    else
      return 'Underflow';
  }
  String feedback(){
    if (bmi>=25){
      return 'You have a higher than a normal body weight. So try to exercise more.....';
    }
    else if (bmi>18)
      return 'You have a normal body weight . Good Job !........';
    else
      return 'You have a lower than normal body weight . So Try to eat more .....';
  }
}