import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MySQL',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter MySQL'),
    );}}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  //Text Controllers to capture data in text fields.
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  //This is the function in which the backend will get communicate to Frontend
  Future<void> saveDataToDatabase() async {
    String url = "http://192.168.100.61/serverside/adddata.php"; //Enter IP-Address of your PC

    Map<String, String> data = {
      'name' : name.text,
      'age' : age.text,
    };

    try{
      final response = await http.post(Uri.parse(url), body: data);
      if(response.statusCode ==200){
        print('Data saved!');
      }
      else{
        print('Failed to save. error: ${response.reasonPhrase}');
      }
    }catch (error){
        print('Failed to save. Error: $error');
      }
    }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        margin: EdgeInsets.all(40),
        child: Column(children: [

          TextField(
            controller: name,
          ),

          TextField(
            controller: age,
          ),

          ElevatedButton(
            child: Text('Save'),
            onPressed: saveDataToDatabase,
          )
        ],)),


    ); }}
