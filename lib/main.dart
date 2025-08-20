// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:utip/widgets/bill_amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_row.dart';
import 'package:utip/widgets/tip_slider.dart';
import 'package:utip/widgets/total_per_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTip',
      theme: ThemeData(  
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  late int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;

  double totalPerPerson(){
    return ((_billTotal * _tipPercentage + _billTotal) / (_personCount));
  }

  double totalTip(){
    return (_billTotal * _tipPercentage);
  }

  //method
   void increment (){
    setState(() {
      _personCount = _personCount + 1;
    });
   }

   void decrement (){
    setState(() {
      if(_personCount > 1){
       _personCount --;
      } 
    });
   }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    double totalT = totalTip();
    //Add Style
    final style = theme.textTheme.titleMedium!.copyWith(
     color: theme.colorScheme.onPrimary,
     fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('UTip'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(style: style, total: total, theme: theme),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.deepPurple,
                  width: 2,
                )
              ),
              child: Column(
                children: [
                  BillAmount(
                    billAmount: _billTotal.toString(),
                    onChanged: (value) { 
                     setState(() {
                       _billTotal = double.parse(value);
                     });
                   },),
                  //split build area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split",style: theme.textTheme.titleMedium,),
                      PersonCounter(personCount: _personCount, theme: theme,onDecrement: decrement,onIncrement: increment,),

                    ],
                  ),
                  // ==Tips Area ==
                  TipRow(theme: theme, totalT: totalT),
                  // ==Slider Text==
                  Text('${(_tipPercentage * 100).round()}%'),
                  // == Slider ==
                  TipSlider(tipPercentage: _tipPercentage, onChanged: (double value) { 
                    setState(() {
                      _tipPercentage = value;
                    });
                   },),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}








