import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomprofile extends StatelessWidget {
  MyCustomprofile({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser; // 유저 들고오기
  get text => null;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var username = user?.displayName; // 유저 이름
          var photoURL = user?.photoURL; // 유저 프로필 사진
          var email = user?.email.toString(); // 유저 이메일
          return Scaffold(
            resizeToAvoidBottomInset : false,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(                          //프로필 흰색 컨테이너 배경(청록색?)
                            color: const Color(0xffAEE6EA),
                            height: 198.h,
                          ),
                        ],),
                      Container(
                        margin: EdgeInsets.fromLTRB(11.w, 69.h, 11.w, 10),
                        padding: EdgeInsets.fromLTRB(16.w, 31.h, 0.0, 33.h),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('나의 프로필',
                                      style: TextStyle(
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xff444d6a),
                                        fontFamily: 'Roboto'
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 13.h),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10.r),
                                            child: Image.network('$photoURL',
                                              width: 59.w,
                                              height: 59.h,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 3.w,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 6.h,),
                                            Text('$username',
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w900,
                                                color: Color(0xff444d6a),
                                                fontFamily: 'Roboto'
                                              ),
                                            ),
                                            Text('$email',
                                              style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Color(0xff444d6a),
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Roboto'
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(width: 17.w),
                                    InkWell(
                                      onTap: () {
                                        print('tap');
                                      },
                                      child: Icon(Icons.more_vert),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r), //모서리를 둥글게
                          color: Colors.white,
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 3.0,
                                offset: Offset(0.0, 0.75)
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(                        //참여중인 방의 컨테이너가 되는 컨테이너
                    margin: EdgeInsets.only(top: 29.h),
                    height: 300.0,
                    width: 320.0,
                    color: const Color(0xffe8f8f9),
                    child: ListView(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Container(                            //참여중인 방
                                child: const Text(
                                  '참여중인 방',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff444d6a),),),
                                padding: const EdgeInsets.fromLTRB(20, 17, 0, 0),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox( //참여중인 방, 방이름(정현우) 거리
                          height: 10,
                        ),

                        Column(                      //방이름
                          children: [
                            OutlinedButton.icon(
                              onPressed: null,
                              icon:  const Icon(Icons.person_search, color: Colors.black, size: 30),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.only(right: 140),
                                backgroundColor: const Color(0xffffffff),
                                minimumSize: const Size(270, 40),// background// foreground
                              ),
                              label: const Text('  정현우',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),


                            const SizedBox( //방이름, 방이름(정현우) 거리
                              width: 0,
                              height: 10,
                            ),


                            Column(                    //방이름 임
                              children: [
                                // ignore: deprecated_member_use
                                OutlinedButton.icon(
                                  onPressed: null,
                                  icon:  const Icon(Icons.phone_android, color: Colors.black, size: 30),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.only(right: 140),
                                    backgroundColor: const Color(0xffffffff),
                                    minimumSize: const Size(270, 40),// background// foreground
                                  ), label: const Text('  정현우',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                ),
                              ],
                            ),



                            const SizedBox( //방이름, 방이름(정현우) 거리
                              width: 0,
                              height: 10,
                            ),



                            Column(                 //방이름
                              children: [
                                // ignore: deprecated_member_use
                                OutlinedButton.icon(
                                  onPressed: null,

                                  icon:  const Icon(Icons.flutter_dash, color: Colors.black, size: 30,),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.only(right: 140),
                                    backgroundColor: const Color(0xffffffff),
                                    minimumSize: const Size(270, 40),// background// foreground
                                  ), label: const Text('  정현우',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),

                                ),
                                ),
                              ],
                            ),


                            const SizedBox( //방이름, 방이름(정현우) 거리
                              width: 0,
                              height: 10,
                            ),


                            Column(                        //방이름 임
                              children: [
                                OutlinedButton.icon(
                                  onPressed: null,
                                  icon:  const Icon(Icons.surfing, color: Colors.black, size: 30, ),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.only(right: 140),
                                    backgroundColor: const Color(0xffffffff),
                                    minimumSize: const Size(270, 40),
                                  ), label: const Text('  정현우',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),

                                ),
                                ),
                              ],
                            ),
                            const SizedBox(  //마지막 방과 참여중인 방 리스트 컨테이너 끝과의 거리
                              width: 0,
                              height: 30,
                            ),
                          ],
                        ),
                      ],
                    ),

                  ),


                  const SizedBox(
                    height: 10,
                  ),  //방코드입력 컨테이너와 참여중인 방 컨테이너 거리 조절 SizedBox

                  Container(
                    width: 320,
                    height: 200,
                    color: const Color(0xffe8f8f9),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                child: const Text('방 코드 입력',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff54ced6)
                                  ),),
                                margin: const EdgeInsets.fromLTRB(0, 20, 170, 0),
                              ),
                            ],
                          ),
                        ),

                        Column(              //방 코드 입력칸
                          children: [
                            Stack(
                              children: [
                                Container(
                                  color: const Color(0xffDCF7F9),
                                  height: 47,
                                  width: 260,
                                  margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                ),
                                Container(
                                  width: 260,
                                  child: const TextField(
                                    maxLength: 6,
                                    decoration: InputDecoration(
                                      hintText: ' ex) ABC123',
                                      fillColor: Color(0xffe8f8f9),
                                    ),
                                  ),
                                  margin: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                                ),
                              ],
                            ),

                            Container(   //화살표 버튼(입력버튼)
                              child: Column(
                                children: [
                                  // ignore: deprecated_member_use
                                  RaisedButton(onPressed: () {}, child: const Icon(Icons.subdirectory_arrow_right, color: Colors.white), color: const Color(0xff54ced6),),
                                ],
                              ),
                              margin: const EdgeInsets.fromLTRB(170, 0, 0, 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),               //바닥이랑 방코드 입력 컨테이너 거리
                ],
              ),
            ),
          );
        });
  }
}