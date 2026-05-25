import 'package:bmi/widgets/costum_app_bar_widget.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.user});

  static const String routeName = "ResultScreen";

  final ResultUserClass user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2135),

      appBar: CustomAppBar(),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Your Result",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xffFFFFFF),
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff333244),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.resultBmi,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: user.categoryColor,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text(
                      user.calculateBmi().toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text(
                      user.healthAdvice,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: MaterialButton(
        color: Color(0xffE83D67),
        padding: EdgeInsets.all(30),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          "Re-Calculate",
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}

class ResultUserClass {
  final double height;
  final int weight;

  ResultUserClass({required this.height, required this.weight});

  double calculateBmi() {
    return weight / ((height / 100) * (height / 100));
  }

  String get resultBmi {
    double bmi = calculateBmi();
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    return "Overweight";
  }

  Color get categoryColor {
    double bmi = calculateBmi();
    if (bmi < 18.5) return Colors.yellow;
    if (bmi < 25) return Colors.green;
    return Colors.red;
  }

  String get healthAdvice {
    double bmi = calculateBmi();
    if (bmi < 18.5) return "Eat more food";
    if (bmi < 25) return "Great shape!";
    return "Exercise more";
  }
}
