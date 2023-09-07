import 'package:clima_app/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima_app/utilities/constants.dart';
import 'package:clima_app/services/weather.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LocationScreen extends StatefulWidget {

    LocationScreen({this.locationWeather});

    final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weather =  WeatherModel();

    late String message;
   late String weatherIcon;
   late String city;
   late int dtemp;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
    // print(temp);
  }

  void updateUI(dynamic weatherData){
    setState(() {

      if(weatherData == null){
        Fluttertoast.showToast(msg: 'Services have crashed please try again later',backgroundColor: Colors.red,webPosition: 'center');
      }
      
   double temp = weatherData['main']['temp'];
   dtemp = temp.toInt();
   message = weather.getMessage(dtemp);
   var condition = weatherData['weather'][0]['id'];
   weatherIcon = weather.getWeatherIcon(condition);
   city = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,elevation: 0),
                    onPressed: () async{
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      
                    ),
                  ),
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,elevation: 0),
                    onPressed: () async{
                     var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) =>  CityScreen()));
                    //  print(typedName);

                    if(typedName != null){
                      var weatherData = await weather.getCityWeather(typedName);
                      updateUI(weatherData);
                    }

                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
               Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$dtemp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(bottom:10.0),
                 child: Center(
                   child: Text(
                     "$message in $city",
                     textAlign: TextAlign.center,
                     style: kMessageTextStyle,
                   ),
                 ),
               ),
               const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

