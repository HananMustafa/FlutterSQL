import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Details extends StatefulWidget{
  List? list;
  dynamic index;

  Details({this.list, this.index});

  @override 
  _DetailsState createState() => _DetailsState();

}

class _DetailsState extends State<Details> {

  void confirm(){


  }
  @override
  Widget build(BuildContext context){
    return Scaffold(


      appBar: AppBar(
        title: Text("${widget.list?[widget.index]['name']}"),
      ),

      body: Container(

        child: Column(children: [

          Text(widget.list?[widget.index] ['name']),
          Text(widget.list?[widget.index] ['mobile'] ), 
          MaterialButton(
            child: Text("Edit"),
            color: Colors.deepOrangeAccent,


            onPressed: (){},
          ),
          MaterialButton(
            child: Text("Delete"),
            color: Colors.deepOrangeAccent,

            onPressed: ()=>confirm(),
          ),
        ],)
      )


    );
  }
}