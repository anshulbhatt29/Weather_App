import 'package:geolocator/geolocator.dart';
class Location
{
  double lati,longi;
 Future< void> getclocation() async
  {
       try{

  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  lati=position.latitude;
  longi=position.longitude;
  }
  catch(e)
  {
    print(e);
  }

  }

}