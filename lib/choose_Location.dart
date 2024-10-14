import 'package:flutter/material.dart';
import 'package:worldtime/Services/world_time.dart';

class Choose_Location extends StatefulWidget {
  const Choose_Location({super.key});

  @override
  State<Choose_Location> createState() => _Choose_LocationState();
}

class _Choose_LocationState extends State<Choose_Location> {
  List<world_time> Locations = [
    world_time(Url: "Africa/Accra", Location: "Ghana", flag: "Ghana.png"),
    world_time(
        Url: "Europe/London", Location: "United Kingdom", flag: "Uk.jpeg"),
    world_time(
        Url: "Asia/Dubai", Location: "United Arab Emirates", flag: "UAE.jpeg"),
    world_time(Url: "Asia/Tokyo", Location: "Japan", flag: "Japan.png"),
    world_time(
        Url: "Australia/Sydney", Location: "Australia", flag: "Australia.png"),
    world_time(Url: "America/New_York", Location: "USA", flag: "us.png"),
    world_time(
        Url: "America/Los_Angeles",
        Location: "USA (California)",
        flag: "us.png"),
    world_time(
        Url: "America/Sao_Paulo",
        Location: "Brazil",
        flag: "Brazil.jpeg"), // GMT-3
    world_time(
        Url: "Europe/Berlin",
        Location: "Germany",
        flag: "Germany.png"), // GMT+2
    world_time(
        Url: "Africa/Johannesburg",
        Location: "South Africa",
        flag: "SA.png"), // GMT+2
    world_time(
        Url: "Asia/Shanghai", Location: "China", flag: "china.png"), // GMT+8
    world_time(
        Url: "Pacific/Auckland",
        Location: "New Zealand",
        flag: "newzealand.png"), // GMT+12
  ];

  void updateTime(index) async {
    world_time instance = Locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.Location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("CHOOSE LOCATION"),
            centerTitle: true,
            backgroundColor: Colors.green.shade400),
        body: ListView.builder(
          itemCount: Locations.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(Locations[index].Location!),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage(("assets/${Locations[index].flag}")),
                  ),
                )));
          },
        ));
  }
}
