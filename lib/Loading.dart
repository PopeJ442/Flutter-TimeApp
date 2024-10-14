import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/Services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void SuperWorldTime() async {
    world_time instance =
        world_time(Location: "Accra", flag: "Ghana", Url: "Africa/Accra");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': instance.Location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    SuperWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SpinKitFadingCube(
      color: Colors.blue,
      size: 80,
    ));
  }
}
