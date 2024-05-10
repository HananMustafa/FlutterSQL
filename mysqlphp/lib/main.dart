import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mysqlphp/Details.dart';
import 'package:mysqlphp/adddata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Adddata(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 Future<List> getData() async{
  final response= await http.get(Uri.parse("http://192.168.100.46/myfolder/getdata.php"));
  return json.decode(response.body);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("My App Bar"),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
     
     
     
      body: FutureBuilder<List>(

        future: getData(),
        builder: (ctx,ss){
          if(ss.hasError){
            print("error");
          }
          if(ss.hasData){
            return Items(list:ss.data);
          }
          else{
            return CircularProgressIndicator();
          }
        }
      ) 
      
    );
  }
}


class Items extends StatelessWidget {

List? list;
Items({this.list});

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: list==null?0:list?.length,
      itemBuilder: (ctx,i){
        return ListTile(
          leading: Icon(Icons.message),
          title: Text(list?[i] ['name']),
          subtitle: Text(list?[i] ['mobile']),
          onTap: ()=>Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => Details(list:list,index:i),
              ), 
          ),
        );
      }
    );
  }
}