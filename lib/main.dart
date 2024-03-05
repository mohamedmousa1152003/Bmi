import 'package:bmi/screen_one.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(BasketBall());
}
class BasketBall extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bmi(),
    );
  }
}