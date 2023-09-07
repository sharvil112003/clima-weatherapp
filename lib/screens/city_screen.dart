import 'package:flutter/material.dart';
import 'package:clima_app/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,elevation: 0),
                  onPressed: () {Navigator.pop(context);},
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value){cityName = value;},
                  style: TextStyle(color: Colors.black ),
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon( Icons.location_city),
                  hintText: "Enter the city name..",
                  hintStyle: TextStyle(color: Colors.grey),
                ),),

                
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,elevation: 0),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context,cityName);
                  });
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}