import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:water_indicator/api_key.dart';

class WeatherProvider extends ChangeNotifier {
  String _weatherCondition = 'Loading...';
  double _temperature = 0.0;
  String _weatherImage = 'assets/image/5.png'; // Default image

  String get weatherCondition => _weatherCondition;
  double get temperature => _temperature;
  String get weatherImage => _weatherImage;

  WeatherProvider() {
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    const apiKey = API_KEY;
    const city = 'Kerala,IN';
    const url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _temperature = data['main']['temp'];
      _weatherCondition = data['weather'][0]['main'];

      switch (_weatherCondition.toLowerCase()) {
        case 'clear':
          _weatherImage = 'assets/image/7.png';
          break;
        case 'rain':
          _weatherImage = 'assets/image/1.png';
          break;
        case 'clouds':
          _weatherImage = 'assets/image/8.png';
          break;
        default:
          _weatherImage = 'assets/image/5.png';
      }

      notifyListeners(); // Notify listeners about data changes
    } else {
      _weatherCondition = 'Error fetching weather';
      notifyListeners();
    }
  }
}
