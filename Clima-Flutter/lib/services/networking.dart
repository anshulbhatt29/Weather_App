import 'package:http/http.dart 'as http;
import 'dart:convert';
class Networking{
  Networking(this.url);
  final String url;
  Future getData() async{
   http. Response re= await http.get(url);
     if(re.statusCode==200)
   {
   String data=re.body;
   return jsonDecode(data);
   }
   else
   print(re.statusCode);
  
}
}