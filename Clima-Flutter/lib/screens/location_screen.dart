import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
 final dynamic data;
  LocationScreen(this.data);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp;
  String cityName,condi,text;
  @override
  void initState() {
  
    super.initState();
      celcius(widget.data);
  }
    WeatherModel w=WeatherModel();
  void celcius(dynamic d)
  {
     setState(() {
       if(d==null)
       {
         temp=0;
         condi='Error';
         text='Unable to get weather data';
         cityName='';
         return;
       }
       
         var temperature=d['main']['temp'];
        temp=temperature.toInt();
       var condition= d['weather'][0]['id'];
    condi=w.getWeatherIcon(condition);
   text= w.getMessage(temp);
    cityName=d['name'];
     });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                     var weatherdata=await w.getLocationWeather();
                     celcius(weatherdata);

                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                     var searchd=await Navigator.push(context, MaterialPageRoute(builder:(context)
                      {
                        return CityScreen();

                      }),
                      );
                      if(searchd!=null)
                      {
                     var ans=await w.getlocationSearch(searchd);
                     celcius(ans);
                      }

                    },
                    child: Icon(
                      Icons.location_city,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      condi,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0,bottom: 10.0),
                child: Text(
                  '$text in $cityName' ,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
