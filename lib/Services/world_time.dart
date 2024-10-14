import 'dart:convert';
import "package:http/http.dart";
import 'package:intl/intl.dart';

class world_time {
  String? Url;
  String? Location;
  String? time;
  String? flag;
  bool? isDay;
  world_time({this.Url, this.Location, this.time, this.flag, this.isDay});

  Future<void> getTime() async {
    try {
      var url = Uri.parse('https://worldtimeapi.org/api/timezone/$Url');
      Response response = await get(url);
      Map data = jsonDecode(response.body);
      String datatime = data["utc_datetime"];
      String utcOffset = data["utc_offset"].substring(2, 3);

      DateTime now = DateTime.parse(datatime);
      now = now.add(Duration(hours: int.parse(utcOffset)));

      isDay = now.hour >= 6 && now.hour <= 18 ? true : false;
      print(isDay);

      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Error Caught:" "$e");
      print(time = "could not get data");
    }
  }
}
