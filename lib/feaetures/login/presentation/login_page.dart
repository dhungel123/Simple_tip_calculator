import 'dart:ffi';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var amount=TextEditingController();
  var people=TextEditingController();
  var tip=TextEditingController();
  int number=20;
  var result='';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Center(child: Text('TipCalculator')),),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            TextField(
              controller:amount ,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Amount'),
                border: OutlineInputBorder(),

              ),
            ),
            const SizedBox(
              height: 20,
            ),
          Slider(
              label: 'Tip',
              value:number.toDouble(),
              min: 5.0,
              max: 50.0,
              onChanged: (double newValue){
                setState(() {
                  number=newValue.round();
                });

              },

            ),

            const SizedBox(
              height: 10,
            ),
            Text('Tip % ${number.toString()}',style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

            const SizedBox(
              height: 10,
            ),
           TextField(
              controller: people,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('People'),
                border: OutlineInputBorder(),

              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                var amounts=int.parse( amount.text);
                var peoples=int.parse(people.text);

                result=(((number/100)*amounts)/2).toString();

              });

            }, child: Text('calculate')
            ),
            Text('Tip per Person is $result',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
          ],
        ),
      ),
    );
  }
}
