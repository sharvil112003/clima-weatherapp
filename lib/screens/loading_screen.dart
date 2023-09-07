import 'dart:convert';

import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services/network.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

@override
  void initState() {
    super.initState();
    getLocationData();
  }

void getLocationData() async{

  
  var weatherData  = await WeatherModel().getLocationWeather();

  Navigator.push(context, MaterialPageRoute(builder: (context){return LocationScreen(locationWeather: weatherData,);}));
  
}

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
 
	return  Scaffold(body: Center(child: SpinKitDoubleBounce(color: Colors.white,size: 100,),),);
}
}
