import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_widget.dart';
import '../components/icon_content.dart';
import 'package:bmi_calculator/screens/constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_button.dart';
import '../calculator_brain.dart';
enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//  Color maleCardColor=inActiveCardColor;
//  Color femaleCardColor=inActiveCardColor;
//  void updateColor(Gender selectedGender){
//    if(selectedGender==Gender.male) {
//      if (maleCardColor == inActiveCardColor) {
//        maleCardColor = activeColor;
//        femaleCardColor = inActiveCardColor;
//      } else {
//        maleCardColor = inActiveCardColor;
//      }
//    }
//    if(selectedGender==Gender.female){
//      if(femaleCardColor==inActiveCardColor){
//        femaleCardColor=activeColor;
//        maleCardColor=inActiveCardColor;
//      }else{
//        femaleCardColor=inActiveCardColor;
//      }
//    }
//
//    }
Gender selectedGender;
int height=180;
int weight=60;
int age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableWidget(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.male;
                  });
                },
                //colour: maleCardColor,
                colour:selectedGender==Gender.male?activeColor:inActiveCardColor ,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'Male',
                ),
              ),
              ),
              Expanded(child: ReusableWidget(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.female;
                  });
                },
                //colour: femaleCardColor,
                colour: selectedGender==Gender.female?activeColor:inActiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus,
                  label: 'Female',
                ),
              ),

              ),
            ],
          ),

          ),
          Expanded(child: ReusableWidget(
            colour: activeColor,
            cardChild: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Height",style: labelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline:TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),style: numberTextStyle,),
                    Text("CM",style: labelTextStyle,),
                  ],
                ),
                SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                  child: Slider(value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      //activeColor: Color(0xFFEB1555),

                      onChanged: (double newValue){
                    setState(() {
                      height=newValue.round();
                    });
                    //print("New Value");
                      }),
                )
              ],
            ),
          ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableWidget(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Weight",style: labelTextStyle,),
                    Text(weight.toString(),style: numberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      RoundIconButtom(
                      icon: FontAwesomeIcons.minus,
                        onPressed: (){
                        setState(() {
                          weight--;
                        });
                        },
                    ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButtom(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),





                      ],
                    ),


                  ],
                ),
                colour: activeColor,
              ),
              ),
              Expanded(child: ReusableWidget(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Age",style: labelTextStyle,),
                    Text(age.toString(),style: numberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButtom(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButtom(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });

                          },
                        ),





                      ],
                    ),


                  ],
                ),
                colour: activeColor,
              ),
              ),
            ],
          ),

          ),
          BottomButton(
            onTap:(){
              Calculator calc=Calculator(height: height,weight: weight);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
      bmiResult: calc.calculatebmi(),
      resultText: calc.getResult(),
      interpretation: calc.getInterpretation(),
    )));
    },
            buttonTitle: "CALCULATE",
          ),

        ],
      ),
    );
  }
}






