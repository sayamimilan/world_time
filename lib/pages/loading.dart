import 'package:flutter/material.dart';
import 'package:flutter_project/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kathmandu', flag: 'kathmandu.png', urlLocation: 'Asia/Kathmandu');
    await instance.getTime();

    // setState(() {
    //   time = instance.time;
    // });

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

 @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
