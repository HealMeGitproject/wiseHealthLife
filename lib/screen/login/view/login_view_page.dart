import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:wisehealthylife/common/provider/auth.dart';
import 'package:wisehealthylife/common/common.dart';

class LoginViewPage extends StatefulWidget {
  const LoginViewPage({Key? key}) : super(key: key);

  @override
  _LoginViewPageState createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage> {
  @override
  Widget build(BuildContext context) {
    return _login();
  }

  Widget _login() { // 로그인 화면
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xffAEE6EA),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffAEE6EA),
        body: Container(
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Container(
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: const Color(0xffAEE6EA),
                            height: MediaQuery.of(context).size.height * 0.30,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor:
                                    Theme.of(context).primaryColor,
                                    radius: 60.r,
                                    child: Image.asset("images/Logo.png"), // 팀로고
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffAEE6EA),
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 65.h,
                                  ),
                                  SignInButton(
                                      buttonType: ButtonType.google,
                                      buttonSize: ButtonSize.large, // small(default), medium, large
                                      onPressed: () {
                                        signInWithGoogle();
                                      }),
                                  SizedBox(height: 20.h),
                                  SignInButton(
                                      buttonType: ButtonType.facebook,
                                      buttonSize: ButtonSize.large, // small(default), medium, large
                                      onPressed: () {
                                        signInWithFacebook();
                                      }),
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  Text( // 멘트
                                    "클릭 한 번으로",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Jua',
                                    ),
                                  ),
                                  Text( // 멘트
                                    "슬기로운 건강생활을 즐겨보세요!",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Jua',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
