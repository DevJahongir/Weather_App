import 'package:climate/controller/global_controller.dart';
import 'package:climate/utils/cutom_colors.dart';
import 'package:climate/widgets/comfort_level.dart';
import 'package:climate/widgets/current_weather_widget.dart';
import 'package:climate/widgets/daily_data_forecast.dart';
import 'package:climate/widgets/header_widget.dart';
import 'package:climate/widgets/hourly_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/clouds.png',
                      height: 200,
                      width: 200,
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              )
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    HeaderWidget(),
                    // for our temp ('current')
                    CurrentWeatherWidget(
                      weatherDataCurrent:
                          globalController.getWeatherData().getCurrentWeather(),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    HourlyDataWidget(
                        weatherDataHourly: globalController
                            .getWeatherData()
                            .getHourlyWeather()),
                    DailyDataForecast(
                      weatherDataDaily:
                          globalController.getWeatherData().getDailyWeather(),
                    ),
                    Container(
                      height: 1,
                      color: CustomColors.dividerLine,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ComfortLevel(
                      weatherDataCurrent:
                          globalController.getWeatherData().getCurrentWeather(),
                    )
                  ],
                ),
              )),
      ),
    );
  }
}
