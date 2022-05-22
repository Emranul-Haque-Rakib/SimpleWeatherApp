
import 'package:http/http.dart' as http;
import 'dart:convert';

 class NetworkHelper{

   NetworkHelper(this.url);
   var url;

   Future getData() async {
     var url2 = Uri.parse(url);

     http.Response response = await http.get(url2);

     if (response.statusCode == 200) {
       String data = response.body;

       var decodedata = jsonDecode(data);

       var temprature = decodedata['main']['temp'];
       var condition = decodedata['weather'][0]['id'];
       var cityName = decodedata['name'];

       print(temprature);
       print(condition);
       print(cityName);
     }

     else(response.statusCode);
   }

 }