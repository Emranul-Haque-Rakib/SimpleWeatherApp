import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'getlocation.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


 initState(){
   Location();
 }

 Location() async {
   getlocation GetLocation=getlocation();
   GetLocation.determinePosition();

   print(GetLocation.Lattitude);
   print(GetLocation.Longtitude);
 }

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()  {

          },
          child: Text("Get Location"),
        ),
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }
}

class a{

}
