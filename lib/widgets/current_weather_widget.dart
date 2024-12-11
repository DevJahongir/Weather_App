import 'package:climate/model/weather_data_current.dart';
import 'package:climate/utils/cutom_colors.dart';
import 'package:flutter/material.dart';

class CurrentWeatherWidget extends StatefulWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  State<CurrentWeatherWidget> createState() => _CurrentWeatherWidgetState();
}

class _CurrentWeatherWidgetState extends State<CurrentWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    // Access weatherDataCurrent via widget
    return Column(
      children: [
        //temp
        tempeatureAreaWidget(),

      SizedBox(height: 20,),
      // more details
    currentWeatherMoreDetailsWidget(),
      ],
    );
  }
  Widget currentWeatherMoreDetailsWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('assets/icons/windspeed.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('assets/icons/clouds.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('assets/icons/humidity.png'),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${widget.weatherDataCurrent.current.windSpeed}km/h',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${widget.weatherDataCurrent.current.clouds}%',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${widget.weatherDataCurrent.current.humidity}%',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget tempeatureAreaWidget (){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/weather/${widget.weatherDataCurrent.current.weather![0].icon}.png",
        height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(text: TextSpan(
          children: [
            TextSpan(
              text: '${widget.weatherDataCurrent.current.temp?.toInt()}°',
              style: TextStyle(
                fontSize: 68,
                fontWeight: FontWeight.w600,
                color: CustomColors.textColorBlack,
              )
            ),
            TextSpan(
                text: '${widget.weatherDataCurrent.current.weather![0].description}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                )
            ),
          ]
        ))
      ],
    );
  }
}
