import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:simple_weather_app/widgets/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const MaterialApp(
          title: 'Weather App',
          debugShowCheckedModeBanner: false,
          home: HomeScreen()),
    );
  }
}
