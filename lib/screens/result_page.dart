import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/constants.dart';
import '../components/reusable_widget.dart';
import '../components/bottom_button.dart';
class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',
            style:titleTextStyle,),
          ),),
          Expanded(flex: 5,
          child: ReusableWidget(
            colour: activeColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resultText.toLowerCase(),
                style: titleTextStyle,),
                Text(bmiResult,
                style: bmiTextStyle,),
                Text(interpretation,
                textAlign: TextAlign.center,
                style: bodyTextStyle,),

              ],
            ),
          ),),
          BottomButton(onTap: (){
            Navigator.pop(context);
          },
              buttonTitle: 'RE-CALCULATE')

        ],
      ),
    );
  }
}
