import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wisehealthylife/common/provider/loading/view/loading.dart';
import 'package:wisehealthylife/screen/lobi/view/lobi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisehealthylife/route.dart';
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
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
        builder: (context, child) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false, // 디버그 숨기기
        title: 'Heal_me_login',
        home: SignInHealMe(),
        getPages: GetXRoutes.routes,
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
             return LoadingViewPage();  // 로딩
          } else {
            if (!snapshot.hasData) { // 데이터가 없으면?
              return LoginViewPage();  // 로그인 위젯
            } else {
              return Lobby(); // 데이터가 있으면 로비 위젯으로(자동 로그인 기능)
            }
          }
        });
  }
}
