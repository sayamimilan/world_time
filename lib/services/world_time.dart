import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  late String time;
  String flag;
  String urlLocation;
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.urlLocation});

  Future <void> getTime() async{

    try {
      //make the request
      String url = 'http://worldtimeapi.org/api/timezone/$urlLocation';
      Response response = await get(Uri.parse(url));
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1, 3);
      String offsetMinutes = data['utc_offset'].substring(4, 6);
      // print(datetime);
      // print(offset);

      // create  DateTime object

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }catch (e){
      print('Error:  $e');
      time = 'Error loading time data!';
    }

  }

}