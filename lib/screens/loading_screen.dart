import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apikey = '514867183e6be6bfc4a903943341c4c9';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}



class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    getLocation();

  }


  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
     latitude = location.latitude;
     longitude = location.longitude;
     // print(latitude);
     // print(longitude);
     getData();
  }
  
  void getData() async{
    http.Response response= await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${apikey}'));
    // http.Response response= await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=121&appid=b6907d289e10d714a6e88b30761fae22'));
    if(response.statusCode == 200){
      String data = response.body;
      // print(data);

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      print(temperature);
      int condition = decodedData['weather'][0]['id'];
      print(condition);

      String cityName = decodedData['name'];
      print(cityName);



    }else{
      print(response.statusCode);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'hi',
        ),
      ),

    );
  }
}
