import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';

const apiKey = '2646668561b9096dc79dd3db7b9baf49';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  void getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
