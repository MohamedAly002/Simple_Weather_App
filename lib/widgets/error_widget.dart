import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var weathercubit = BlocProvider.of<GetWeatherCubit>(context);

    return Container(
      color: Color(0xff2e335a),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'oops! something went wrong.\nplease check your connection',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  weathercubit.getWeatherData();
                },
                child: const Text('Try Again')),
          ],
        ),
      ),
    );
  }
}
