import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';

class LoadedDataScreen extends StatelessWidget {
  const LoadedDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherdata = BlocProvider.of<GetWeatherCubit>(context).weatherdata;

    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/weather_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Text(
              weatherdata.cityName,
              style: const TextStyle(color: Colors.white, fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${weatherdata.temperature.toStringAsFixed(0)}°',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.80),
                    fontSize: 60,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                weatherdata.image != null
                    ? Image.network(
                        'http://openweathermap.org/img/w/${weatherdata.image}.png',
                        width: 50,
                        height: 50,
                      )
                    : const Icon(Icons.error, color: Colors.white, size: 30),
              ],
            ),
            Text(
              weatherdata.description,
              style: TextStyle(
                color: const Color(0xffBBB5E3).withOpacity(0.87),
                fontSize: 24.76,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'H: ${weatherdata.maxTemp.toStringAsFixed(0)}°',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.80),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'L: ${weatherdata.minTemp.toStringAsFixed(0)}°',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.80),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
