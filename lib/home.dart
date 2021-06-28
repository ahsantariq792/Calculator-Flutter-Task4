import 'dart:html';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget {
 

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
 
 
  @override

  
var result= "";

    Widget btn(var text){
    
      
    return SizedBox(
      height: 100,
      child: ElevatedButton(onPressed:(){

        
        setState((){
          result=result+text;
        });

      },
       style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                  
                  textStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      
                       fontFamily:'Calibri',
                      color: Colors.blueGrey)),
       child: Text(text),
       ),
    );
  }

  clear(){
    setState(() {
      result="";
    });
    
  }

 output(){
   Parser p =Parser();
   Expression exp =p.parse(result);
   ContextModel cm=ContextModel();
   double eval =exp.evaluate(EvaluationType.REAL,cm);
    
    setState(() {
      result=eval.toString();
    });



 }



  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: Colors.brown,
      body: Column(
        children:[
          
          Container(
            padding: EdgeInsets.only(top:28),
            height:100,
           
            
        
        
            child: Text(result,style:TextStyle(
            fontSize: 30,fontWeight: FontWeight.bold,
            color: Colors.white,
            
            //  backgroundColor: Colors.yellow[100],
        ),
        ),
          ),
         Row(
          
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             
             btn("7"),
             btn("8"),
             btn("9"),
             btn("-"),
           ],
           
           
         ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             btn("4"),
             btn("5"),
             btn("6"),
             btn("/")
           ],
           
           
         ),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             btn("1"),
             btn("2"),
             btn("3"),
             btn("*")
           ],
           
           
         ),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
            //  btn("C"),
            ElevatedButton(onPressed: clear, child: Text("C"),
             style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                  
                  textStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),),
             btn("0"),
             ElevatedButton(onPressed: output, child: Text("="),
             style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
                  
                  textStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),),
             btn("+")
           ],
           
           
         ),
        ]
      ),
    );
  }
}