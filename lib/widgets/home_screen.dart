import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:simple_weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:simple_weather_app/widgets/error_widget.dart';
import 'package:simple_weather_app/widgets/loaded_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetWeatherCubit>(context).getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is IntialLoadingState) {
            return Container(
              color: const Color(0xff2e335a),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          } else if (state is LoadedState) {
            return const LoadedDataScreen();
          } else {
            return const ErrorScreen();
          }
        },
      ),
    );
  }
}
