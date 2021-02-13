
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';




class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    locationData();
  }
  void locationData() async
  {
    var data= await WeatherModel().getLocationWeather();

  Navigator.push(context, MaterialPageRoute(builder:( context)
  {
    return LocationScreen(data);
  }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(child: 
         SpinKitFadingCircle(
          color:Colors.white,
          size:100.0,
      ),
    ),
    );
  }
  
}
