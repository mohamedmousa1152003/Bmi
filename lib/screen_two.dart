import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget{
  static String routeName = 'result';
  final double result ;
  final double height;
  final int weight;
  final bool gender;
  final int age ;
  resultScreen({ required this.weight,required this.height,required this.result, required this.gender, required this.age});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title : const Text( "BMI CALCULATOR" ,style:  TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold ,),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 20),
          const Text( "Your Result" ,style:  TextStyle(fontSize: 40 ,fontWeight: FontWeight.bold , color: Colors.black),),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 50),
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    text:  TextSpan(
                      children:  [
                        const TextSpan(text: "Gender : " ,style:   TextStyle(fontSize: 30 ,color: Colors.red ,fontWeight: FontWeight.bold)),
                        TextSpan(text: gender? "Male" : "Female" ,style: const  TextStyle(fontSize: 30,color: Colors.black )),
                      ],
                    ),
                  ),
                  RichText(
                    text:  TextSpan(
                      children:  [
                        const TextSpan(text: " Age : " ,style:  const TextStyle(fontSize: 30 ,color: Colors.red ,fontWeight: FontWeight.bold)),
                        TextSpan(text: " $age" ,style:  const TextStyle(fontSize: 30,color: Colors.black )),
                      ],
                    ),
                  ),
                  RichText(
                    text:  TextSpan(
                      children:  [
                        const TextSpan(text: " Height : " ,style:  TextStyle(fontSize: 30 ,color: Colors.red ,fontWeight: FontWeight.bold)),
                        TextSpan(text: " ${height.round()}" ,style:  const TextStyle(fontSize: 30,color: Colors.black )),

                      ],
                    ),
                  ),
                  RichText(
                    text:  TextSpan(
                      children:  [
                        const TextSpan(text: "\t Weight : " ,style:   TextStyle(fontSize: 30 ,color: Colors.red ,fontWeight: FontWeight.bold)),
                        TextSpan(text: " $weight" ,style:  const TextStyle(fontSize: 30,color: Colors.black )),

                      ],
                    ),
                  ),
                  RichText(
                    text:  TextSpan(
                      children:  [
                        const TextSpan(text: "BMI : " ,style:   TextStyle(fontSize: 30 ,color: Colors.red ,fontWeight: FontWeight.bold)),
                        TextSpan(text: " ${result.toStringAsFixed(2)}" ,style:  const TextStyle(fontSize: 30,color: Colors.black )),

                      ],
                    ),
                  ),
                  RichText(
                    text:  TextSpan(
                      children:  [
                        const TextSpan(text: "Result : " ,style:  TextStyle(fontSize: 30 ,color: Colors.red ,fontWeight: FontWeight.bold)),
                        // TextSpan(text: " ${result.round()}" ,style: const TextStyle(fontSize: 30,color: Colors.black )),
                        TextSpan(text:resultBmi() ,style: const TextStyle(fontSize: 30,color: Colors.black ) )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  String? resultBmi(){
    if(result < 18.5){
      return "weight loss";
    }
    else if(result >= 18.5 && result <= 25  ){
      return "Healthy weight ";
    }
    else if(result > 25 && result <=29.9  ){
      return "Over weight";
    }
    else{
      return "Excess obesity weight" ;
    }
  }

}