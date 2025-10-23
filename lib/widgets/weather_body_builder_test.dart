// import 'package:flutter/material.dart';
// import 'package:weather_app/models/weather_model.dart';
// import 'package:weather_app/services/weather_service.dart';
// import 'package:weather_app/widgets/weather_body.dart';

// class WeatherBodyBuilder extends StatefulWidget {
//   final String city;

//   const WeatherBodyBuilder({super.key, required this.city});

//   @override
//   State<WeatherBodyBuilder> createState() => _WeatherBodyBuilderState();
// }

// class _WeatherBodyBuilderState extends State<WeatherBodyBuilder> {
//   late final Future<WeatherModel> weather;

//   @override
//   void initState() {
//     super.initState();
//     weather = WeatherService().getWeather(city: widget.city);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<WeatherModel>(
//       future: weather,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(
//             child: Text('Oops, there was an error. try later.'),
//           );
//         } else if (snapshot.hasData) {
//           return WeatherBody(weather: snapshot.data!);
//         } else {
//           return const Center(child: Text('There is no data'));
//         }
//       },
//     );
//   }
// }
