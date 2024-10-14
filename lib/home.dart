import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String dayImage = data['isDay'] ? 'day.jpeg' : 'Night.jpeg';
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$dayImage'), fit: BoxFit.fill)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
          child: Column(
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/choose_Location");
                    setState(() {
                      data = {
                        'time': result["time"],
                        'location': result['location'],
                        'isDay': result['isDay'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: const Icon(Icons.edit_location),
                  label: const Text("Location")),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: const TextStyle(fontSize: 32),
                  ),
                ],
              ),
              Text(data["time"], style: const TextStyle(fontSize: 66)),
            ],
          ),
        ),
      ),
    ));
  }
}
