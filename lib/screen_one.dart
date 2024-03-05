import 'dart:math';
import 'package:bmi/screen_two.dart';
import 'package:flutter/material.dart';
class Bmi extends StatefulWidget{
  static String routeName="home";
  const Bmi({super.key});
  @override
  State<Bmi> createState() => _BmiState();
}
class _BmiState extends State<Bmi> {
  bool isMale =true ;
  var height= 100.0;
  int weight =40;
  int ageAddORRemove =20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 5,),
          const Text( "BMI CALCULATOR" ,style:  TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold ,),),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isMale=true;
                    });
                  },
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isMale? Colors.red : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.male,size: 100,),
                        Text( "MALE" ,style:  TextStyle(fontSize: 30 ),),

                      ],
                    ),
                  ),
                ),),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    isMale =false;
                  });
                },
                child: Container(
                  height: 180,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isMale ? Colors.white : Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.female,size: 100,),
                      Text( "FEMALE" ,style:  TextStyle(fontSize: 30 , ),),

                    ],
                  ),
                ),
              ),),
            ],
          ),
          Container(
            height: 150,
            margin: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white , width: 10),
              borderRadius: BorderRadius.circular(25),
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text( "Height" ,style:  TextStyle(fontSize: 30 ),),
                RichText(
                  text:  TextSpan(
                    children:  [
                      TextSpan(text: "${height.round()}" ,style:  const TextStyle(fontSize: 35 ,color: Colors.red ,fontWeight: FontWeight.bold)),
                      const TextSpan(text: " cm" ,style:  TextStyle(fontSize: 25,color: Colors.black )),
                    ],
                  ),
                ),
                Expanded(
                  child: Slider(
                      inactiveColor: Colors.black,
                      activeColor: Colors.red,
                      min: 40,
                      value:height ,
                      max:250 ,
                      onChanged: (val){
                        height=val;
                        setState(() {

                        });
                      }),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(child: Container(
                height: 180,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white , width: 10),
                  borderRadius: BorderRadius.circular(25),
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text( "Weight" ,style:  const TextStyle(fontSize: 35 ,color: Colors.black ,fontWeight: FontWeight.bold)),
                    RichText(
                      text:   TextSpan(
                        children:  [
                          TextSpan(text: "$weight" ,style:  const TextStyle(fontSize: 35 ,color: Colors.red ,fontWeight: FontWeight.bold)),
                          const TextSpan(text: " Kg" ,style:  TextStyle(fontSize: 25,color: Colors.black )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                            weight++;
                          });
                        }, icon: const CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.add ,size: 25,),
                        )),
                        IconButton(onPressed: (){
                          setState(() {
                            weight--;
                          });
                        }, icon: const CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.remove ,size: 25,),
                        )),

                      ],
                    ),

                  ],
                ),
              ),),
              Expanded(child: Container(
                height: 180,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white , width: 10),
                  borderRadius: BorderRadius.circular(25),
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text( "Age" ,style:   TextStyle(fontSize: 35 ,color: Colors.black ,fontWeight: FontWeight.bold)),
                    Text( "$ageAddORRemove" ,style: const  TextStyle(fontSize: 35 ,color: Colors.red ,fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: (){
                          ageAddORRemove++;
                          setState(() {

                          });
                        }, icon: const CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.add ,size: 25,),
                        )),
                        IconButton(onPressed: (){
                          ageAddORRemove--;
                          setState(() {

                          });
                        }, icon: const CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.remove ,size: 25,),
                        )),

                      ],
                    ),

                  ],
                ),
              ),),
            ],
          ),
          Container(
            margin:const  EdgeInsets.symmetric(horizontal: 8),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
            child: MaterialButton(
              onPressed: (){
                var result =weight / pow(height /100, 2);
                print(result.round());
                Navigator.push(context, MaterialPageRoute(builder: (context) => resultScreen(
                  result: result,
                  age: ageAddORRemove,
                  gender: isMale,
                  height:height ,
                  weight: weight,
                ),
                ),
                );

              } ,
              child: const Text("CALCULATOR" ,style:  TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold ,),),
            ),
          ),
        ],
      ),
    );
  }
}