import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisehealthylife/common/provider/auth.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: Center(
            child: Column(
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  Text('Setting',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.greenAccent),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    child: Text('SignOut',
                      style: TextStyle(
                          fontSize: 40.0, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder( //모서리를 둥글게
                          borderRadius: BorderRadius.circular(20)),
                      primary: const Color(0xffaee6ea),
                      minimumSize: Size(200, 50),
                    ),
                    onPressed: () {
                      firebaseLogOut();  //현재 앱에서 로그인을 해제합니다(그다음으로 앱을 실행하려면 앱을 껏다 켜야합니다)
                      Navigator.pop(context);
                    },
                  ),
                ]
            ),
          ),
        );
      },
    );
  }
}