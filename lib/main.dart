import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_indicator/weather_provider.dart';
import 'package:water_indicator/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WeatherScreen(),
      ),
    );
  }
}
// the whole app for weater convert into provoider
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Weather App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const WeatherScreen(),
//     );
//   }
// }

// class WeatherScreen extends StatefulWidget {
//   const WeatherScreen({super.key});

//   @override
//   _WeatherScreenState createState() => _WeatherScreenState();
// }

// class _WeatherScreenState extends State<WeatherScreen> {
//   String _weatherCondition = 'Loading...';
//   double _temperature = 0.0;
//   String _weatherImage = 'assets/image/5.png'; // Default image

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeather();
//   }

//   Future<void> _fetchWeather() async {
//     const apiKey =
//         '799c088830d491135fddbe36fb59a6f9'; // Replace with your OpenWeatherMap API key
//     const city = 'Kerala,IN';
//     const url =
//         'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         _temperature = data['main']['temp'];
//         _weatherCondition = data['weather'][0]['main'];

//         switch (_weatherCondition.toLowerCase()) {
//           case 'clear':
//             _weatherImage = 'assets/image/7.png';
//             break;
//           case 'rain':
//             _weatherImage = 'assets/image/1.png';
//             break;
//           case 'clouds':
//             _weatherImage = 'assets/image/8.png';
//             break;
//           default:
//             _weatherImage = 'assets/image/5.png';
//         }
//       });
//     } else {
//       // Handle error
//       setState(() {
//         _weatherCondition = 'Error fetching weather';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final DateTime now = DateTime.now();
//     final String formattedDate = DateFormat('dd MMMM yyyy').format(now);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Weather App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Text(
//             //   'Date: $formattedDate',
//             //   style: const TextStyle(fontSize: 20),
//             // ),
//             // const SizedBox(height: 20),
//             // Text(
//             //   'Temperature: ${_temperature.toStringAsFixed(1)}°C',
//             //   style: const TextStyle(fontSize: 30),
//             // ),
//             // const SizedBox(height: 20),
//             // Text(
//             //   'Weather: $_weatherCondition',
//             //   style: const TextStyle(fontSize: 30),
//             // ),
//             // const SizedBox(height: 20),
//             // Image.asset(
//             //   _weatherImage,
//             //   width: 100,
//             //   height: 100,
//             // ),
//             Container(
//               // height: MediaQuery.of(context).size.height * 0.2,
//               padding: const EdgeInsets.symmetric(
//                   //vertical: 1.0,
//                   horizontal: 2.0),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Image.asset(
//                     _weatherImage,
//                     // width: MediaQuery.of(context).size.width * 0.2
//                     width: 63,
//                     fit: BoxFit.contain,
//                   ),
//                   const SizedBox(width: 8),
//                   Column(
//                     children: [
//                       Text(
//                         '${_temperature.toStringAsFixed(1)}°C\n$_weatherCondition',
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                             fontSize: 22, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         formattedDate,
//                         style: const TextStyle(
//                             fontSize: 12, color: Colors.black54),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }
