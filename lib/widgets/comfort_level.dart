import 'package:climate/model/weather_data_current.dart';
import 'package:climate/utils/cutom_colors.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ComfortLevel extends StatefulWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const ComfortLevel({super.key, required this.weatherDataCurrent});

  @override
  State<ComfortLevel> createState() => _ComfortLevelState();
}

class _ComfortLevelState extends State<ComfortLevel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: Text(
            'Comfort Level',
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue:
                      widget.weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                    infoProperties: InfoProperties(
                        bottomLabelText: 'Humidity',
                        bottomLabelStyle: TextStyle(
                            letterSpacing: 0.1, fontSize: 14, height: 1.5)),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor:
                            CustomColors.firstGradientColor.withAlpha(100),
                        progressBarColors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor
                        ]),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Feels Like ',
                      style: TextStyle(
                        fontSize: 14,
                        height: 0.8,
                        color: CustomColors.textColorBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '${widget.weatherDataCurrent.current.feelsLike!}',
                      style: TextStyle(
                        fontSize: 14,
                        height: 0.8,
                        color: CustomColors.textColorBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ])
                  ),
                  Container(
                    height: 25,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    width: 1,
                    color: CustomColors.dividerLine,
                  ),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'UV Index ',
                          style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '${widget.weatherDataCurrent.current.uvIndex!}',
                          style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ])
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
