import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void getCurrentPosition()async{
    LocationPermission permission =await Geolocator.checkPermission();

    if (permission == LocationPermission.denied||permission ==LocationPermission.deniedForever){
    print("Permission not given");
    LocationPermission asked = await Geolocator.requestPermission();
  }
  else{
  Position currentPosition =await Geolocator.getCurrentPosition();
  print("Latitude:"+ currentPosition.latitude.toString());
  print("Longitude:"+ currentPosition.longitude.toString());

  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              getCurrentPosition();
            },
            child: Text('GetLocation'),
          ),
        ),
      ),
    );
  }
}
