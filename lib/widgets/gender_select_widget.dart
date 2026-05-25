import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GenderSelectWidget extends StatelessWidget {
   GenderSelectWidget({
    super.key,
    required this.pathImagePng,
    required this.text,
    required this.isSelcted,
    this.onTap,
  });

  String pathImagePng;
  String text;
  bool isSelcted;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: isSelcted ? Color(0xff24263B) : Color(0xff333244),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Image.asset(pathImagePng),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: .w400,
                  color: Color(0xff8B8C9E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
