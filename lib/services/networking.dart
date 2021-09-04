import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper{
  final String url;

  NetworkHelper({@required this.url});

  Future getData() async{
    http.Response response= await http.get(Uri.parse(url));
    // http.Response response= await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=121&appid=b6907d289e10d714a6e88b30761fae22'));
    if(response.statusCode == 200){
      String data = response.body;
      // print(data);

      var decodedData = jsonDecode(data);

      return decodedData;
    }else{
      print(response.statusCode);
    }
  }
}