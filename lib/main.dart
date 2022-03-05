import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wisehealthylife/screen/lobi.dart';
import 'package:wisehealthylife/provider/loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
//page package
import 'package:wisehealthylife/screen/login/view/login_view_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 파베
  await Firebase.initializeApp(); // 접속
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(300, 800),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false, // 디버그 숨기기
        title: 'Heal_me_login',
        home: SignInHealMe(),
        getPages: [
          GetPage(name: '/login', page: () => const LoginViewPage())
        ],
      ),
    );
  }
}

class SignInHealMe extends StatefulWidget {
  const SignInHealMe({Key? key}) : super(key: key);

  @override
  _SignInHealMeState createState() => _SignInHealMeState();
}

class _SignInHealMeState extends State<SignInHealMe> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _auth.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) { // 데이터가 들어오는 중이라면?
            return Loading(); // 로딩
          } else {
            if (!snapshot.hasData) { // 데이터가 없으면?
              return _login(); // 로그인 위젯
            } else {
              return Lobby(); // 데이터가 있으면 로비 위젯으로(자동 로그인 기능)
            }
          }
        });
  }
}
