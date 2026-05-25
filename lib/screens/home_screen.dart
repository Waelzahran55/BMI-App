
import 'package:bmi/widgets/gender_select_widget.dart';
import 'package:bmi/screens/result_screen_bmi.dart';
import 'package:bmi/widgets/user_info_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;

  double height = 120;

  int weight = 70;

  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2135),
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text("BMI Calculator"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: .w600,
          color: Color(0xffFFFFFF),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff24263B),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          spacing: 16,
          children: [
            Row(
              spacing: 10,
              children: [
                GenderSelectWidget(
                  pathImagePng: "assets/images/material-symbols_male.png",
                  text: "Male",
                  isSelcted: isMale,
                  onTap: () {
                    isMale = true;
                    setState(() {});
                  },
                ),

                GenderSelectWidget(
                  pathImagePng: "assets/images/material-symbols_female.png",
                  text: "Female",
                  isSelcted: !isMale,
                  onTap: () {
                    isMale = false;
                    setState(() {});
                  },
                ),
              ],
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(color: Color(0xff333244)),
                child: Column(
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: .w300,
                        color: Color(0xff8B8C9E),
                      ),
                    ),

                    Text.rich(
                      TextSpan(
                        text: height.round().toString(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: .bold,
                          color: Color(0xffFFFFFF),
                        ),

                        children: [
                          TextSpan(
                            text: "cm",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: .w500,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Slider(
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                      min: 50,
                      max: 200,
                      activeColor: Color(0xffE83D67),
                      inactiveColor: Color(0xffFFFFFF),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                spacing: 10,
                children: [
                  UserInfo(
                    userInfoText: "Weight",
                    userInfoData: weight,
                    onPressedAdd: () {
                      weight++;
                      setState(() {});
                    },
                    onPressedRemove: () {
                      if (weight > 0) {
                        weight--;
                        setState(() {});
                      }
                    },
                  ),
                  UserInfo(
                    userInfoText: "Age",
                    userInfoData: age,
                    onPressedAdd: () {
                      age++;
                      setState(() {});
                    },
                    onPressedRemove: () {
                      if (age > 0) {
                        age--;
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: MaterialButton(
        color: const Color(0xffE83D67),
        padding: const EdgeInsets.all(10),
        onPressed: () {
         Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => ResultScreen(
      user: ResultUserClass(height: height, weight: weight),
    ),
  ),
);
        },
        child: const Text(
          "Calculate",
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
