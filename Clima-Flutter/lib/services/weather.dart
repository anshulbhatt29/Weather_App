import 'package:clima/services/networking.dart';
import 'package:clima/screens/location.dart';

const  api='151703f56388ee3559a64e4d9e2543f7';
const openmapurl='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
 Future<dynamic> getlocationSearch(String ans) async
  {
     Networking n=Networking('$openmapurl?q=$ans&appid=$api&units=metric');
     var search=await n.getData();
     return search;

  }
 Future<dynamic> getLocationWeather() async
  {
        Location l=Location();
   await l.getclocation();
   Networking nt=Networking('$openmapurl?lat=${l.lati}&lon=${l.longi}&appid=$api&units=metric');
  var data=await nt.getData();
  return data;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
