import 'package:clima_app/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

	
void getLocation() async{
  LocationPermission permission = await Geolocator.checkPermission();
  
  Position position =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
  print(position);
  
}

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
	return  MaterialApp(
		darkTheme: ThemeData.dark(),
    theme: ThemeData.light(),

    home: const LoadingScreen(),
   

	);
}
}
