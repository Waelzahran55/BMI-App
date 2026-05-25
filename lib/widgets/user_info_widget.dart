import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserInfo extends StatelessWidget {
  UserInfo({
    super.key,
    required this.userInfoData,
    required this.userInfoText,
    this.onPressedAdd,
    this.onPressedRemove,
  });

  String userInfoText;
  int userInfoData;
  void Function()? onPressedAdd;
  void Function()? onPressedRemove;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xff333244),
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          children: [
            Text(
              userInfoText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w300,
                color: Color(0xff8B8C9E),
              ),
            ),

            Text(
              userInfoData.toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: .w600,
                color: Color(0xffFFFFFF),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  backgroundColor: Color(0xff8B8C9E),
                  shape: CircleBorder(),
                  onPressed: onPressedAdd,
                  child: Icon(Icons.add, color: Color(0xffFFFFFF)),
                ),
                FloatingActionButton(
                  shape: CircleBorder(),
                  backgroundColor: Color(0xff8B8C9E),
                  onPressed: onPressedRemove,
                  child: Icon(Icons.remove, color: Color(0xffFFFFFF)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
