import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/constants.dart';
class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;
  BottomButton({@required this.onTap, @required this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      //(){
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage()));
      //},
      child: Container(
        child: Center(child: Text(buttonTitle,style: largeButtonTextStyle,)),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}