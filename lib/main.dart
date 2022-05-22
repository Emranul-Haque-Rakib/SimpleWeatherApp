import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/TextStyle.dart';
import 'package:weatherapp/networkingstuff.dart';
import 'getlocation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


const apiKey= 'b57065650a27b22fd7a7dda901a0a6ef';

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

class _MyHomePageState extends State<MyHomePage> {

  initState() {
    LocationData();
  }

  var Longtitude;
  var Latitude;

  LocationData() async {
    getlocation GetLocation = getlocation();
    await GetLocation.determinePosition();

   Latitude= GetLocation.Lattitude;
   Longtitude=  GetLocation.Longtitude;

   NetworkHelper networkHelper=  NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$Latitude&lon=$Longtitude&appid=$apiKey');
   var weatherData= await networkHelper.getData();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(

      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Location",style: MyTextStyle,
            ),

            Text("Temparatue",style: MyTextStyle,)

          ],
        ),
      ),
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }
}
