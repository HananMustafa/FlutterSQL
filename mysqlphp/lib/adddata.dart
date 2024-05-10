import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Adddata extends StatefulWidget{
  @override
  _AdddataState createState() => _AdddataState();
}

class _AdddataState extends State<Adddata>{
  TextEditingController namectrl = TextEditingController();
  String name='';
  TextEditingController mobilectrl = TextEditingController();
  String mobile='';


  Future<void> saveDataToDatabase() async {
    String url = "http://192.168.100.61/myfolder/adddata.php";

    Map<String, String> data = {
      'name' : namectrl.text,
      'mobile' : mobilectrl.text,
    };

    try{
      final response = await http.post(Uri.parse(url), body: data);
      if(response.statusCode ==200){
        print('Data saved!');
      }
      else{
        print('Failed to save. error: ${response.reasonPhrase}');
      }
    }
      catch (error){
        print('Failed to save. Error: $error');
      }
    }
  



  @override
  Widget build(BuildContext context){
    return Scaffold(

body: Container(
  child: Column(
    children: [
      Container(
                margin: const EdgeInsets.only(top: 5, right:20, left:20),
                    child: TextField(
                      controller: namectrl,
                ),  ),

      Container(
                margin: const EdgeInsets.only(top: 5, right:20, left:20),
                    child: TextField(
                      controller: mobilectrl,
                ),  ),

      Container(
                margin: const EdgeInsets.only(top: 5, right:20, left:20),
                child: ElevatedButton(
                onPressed: saveDataToDatabase, 
                child: Text('Save')),
      )


    ],))
 );}}