import 'package:flutter/material.dart';
import 'package:flutter_project/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(urlLocation: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urlLocation: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urlLocation: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urlLocation: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urlLocation: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urlLocation: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urlLocation: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(urlLocation: 'Asia/Kathmandu', location: 'Kathmandu', flag: 'nepal.png'),
    WorldTime(urlLocation: 'Europe/Warsaw', location: 'Warsaw', flag: 'poland.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
