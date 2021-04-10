import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:circle_list/circle_list.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:safety/pages/Voice.dart';
import 'package:safety/pages/center_map.dart';
import 'package:safety/pages/emergency_map.dart';
import 'package:safety/pages/nearby_places.dart';
import 'package:safety/pages/photo_capture.dart';
import 'package:safety/services/calls_and_messages_service.dart';
import 'package:safety/services/service_locator.dart';
import 'package:safety/shared/constants.dart';

class Hom extends StatefulWidget {
  static final String route = '/hom';

  // static AudioCache player = AudioCache();
  @override
  _HomState createState() => _HomState();
}

class _HomState extends State<Hom> with SingleTickerProviderStateMixin {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  final String number = "8778318778";
  final String email = "rakulcareer6@gmail.com";
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  AnimationController _animationController;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  void _runAnimation() async {
    while (true) {
      await _animationController.forward();
      await _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(Hom());
        return true;
      },
      child: Scaffold(
        // backgroundColor: HexColor('#FFC3CF'),
        body: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [HexColor('#FF8008'), HexColor('#FFC837')],
                  // begin: Alignment.topLeft,
                  // end: Alignment.bottomRight
                  radius: 1.5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment = MainAxisAlignment.spaceEvenly
              children: [
                Container(
                  height: 100,
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ScaleAnimatedTextKit(
                          onTap: () {
                            print("Tap Event");
                          },
                          text: [
                            "Emergency",
                          ],
                          textStyle: TextStyle(
                              fontSize: 50.0,
                              fontFamily: "Canterbury",
                              color: HexColor("#E6E3F2"),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional
                              .topStart // or Alignment.topLeft
                          ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width - 10,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 70.0, // soften the shadow
                                spreadRadius: 20.0, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  0.0, // Move to bottom 5 Vertically
                                ),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(1000),
                            gradient: RadialGradient(radius: 0.7, colors: [
                              HexColor('#fa922a'),
                              HexColor('#fff')
                            ]),
                            border: Border.all(
                                color: HexColor('#fff'), width: 2)),
                        child: AvatarGlow(
                          endRadius: 200.0,
                          startDelay: Duration(seconds: 1),
                          glowColor: Colors.deepOrange[50],
                          child: CircleList(
                            initialAngle: 55,
                            outerRadius:
                                MediaQuery.of(context).size.width / 2.2,
                            innerRadius: MediaQuery.of(context).size.width / 5,
                            showInitialAnimation: true,
                            innerCircleColor: Colors.white54,
                            outerCircleColor: Colors.white30,
                            origin: Offset(0, 0),
                            rotateMode: RotateMode.onlyChildrenRotate,
                            centerWidget: InkWell(
                              onDoubleTap: () {
                                Navigator.pushNamed(context, MyHomePage.route);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    // gradient: but,
                                    borderRadius: BorderRadius.circular(1000),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white70,
                                        blurRadius: 10.0, // soften the shadow
                                        spreadRadius: 10.0, //extend the shadow
                                        offset: Offset(
                                          0.0, // Move to right 10  horizontally
                                          0.0, // Move to bottom 5 Vertically
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: HomePage()),
                            ),
                            children: [
                              AvatarGlow(
                                endRadius: 70.0,
                                glowColor: HexColor("#FFDE7D"),
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      // color: Colors.transparent,
                                      border: Border.all(
                                          // color: HexColor("#ea6a88"),
                                          width: 3)),
                                  child: RaisedButton(
                                    elevation: 1,
                                    color: Colors.white70,
                                    onPressed: () => {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1200)),
                                                  //this right here
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 20.0,
                                                          color: Color(
                                                              0xFFFFDE7D)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3000.0),
                                                    ),
                                                    child: RaisedButton(
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2000.0)),
                                                      onPressed: () =>
                                                          _service.call(number),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 55,
                                                                right: 55),
                                                        height: 250,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            RotationTransition(
                                                              turns: Tween(
                                                                      begin:
                                                                          0.0,
                                                                      end: -.1)
                                                                  .chain(CurveTween(
                                                                      curve: Curves
                                                                          .elasticIn))
                                                                  .animate(
                                                                      _animationController),
                                                              child: Icon(
                                                                  Icons.call,
                                                                  size: 70,
                                                                  color: Color(
                                                                      0xFFFFDE7D)),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              'Call',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFFFFDE7D),
                                                                fontSize: 20,
                                                                // fontWeight:
                                                                // FontWeight.w300,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1200)),
                                                  //this right here
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 20.0,
                                                          color: Color(
                                                              0xFFFFDE7D)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3000.0),
                                                    ),
                                                    child: RaisedButton(
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2000.0)),
                                                      onPressed: () => _service
                                                          .sendSms(number),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 55,
                                                                right: 55),
                                                        height: 250,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            RotationTransition(
                                                              turns: Tween(
                                                                      begin:
                                                                          0.0,
                                                                      end: -.1)
                                                                  .chain(CurveTween(
                                                                      curve: Curves
                                                                          .elasticIn))
                                                                  .animate(
                                                                      _animationController),
                                                              child: Icon(
                                                                  Icons.message,
                                                                  size: 70,
                                                                  color: Color(
                                                                      0xFFFFDE7D)),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              'Message',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFFFFDE7D),
                                                                fontSize: 20,
                                                                // fontWeight:
                                                                // FontWeight.w300,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                      _runAnimation(),
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.call,
                                          size: 40,
                                          color: HexColor("#12AB7D"),
                                        ),
                                        Text(
                                          'SOS',
                                          style: TextStyle(
                                              color: HexColor("#12AB7D"),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //(sos)
                              AvatarGlow(
                                endRadius: 70.0,
                                glowColor: Colors.deepOrange[50],
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      // color: Colors.transparent,
                                      border: Border.all(
                                          // color: HexColor("#ea6a88"),
                                          width: 3)),
                                  child: RaisedButton(
                                    elevation: 1,
                                    color: Colors.white70,
                                    onPressed: Constants.policeStaionFunction,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.local_parking,
                                          size: 40,
                                          color: HexColor("#12AB7D"),
                                        ),
                                        Text(
                                          'Police',
                                          style: TextStyle(
                                              color: HexColor("#12AB7D"),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //(Police)

                              AvatarGlow(
                                endRadius: 70.0,
                                glowColor: Colors.deepOrange[50],
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      // color: Colors.transparent,
                                      border: Border.all(
                                          // color: HexColor("#ea6a88"),
                                          width: 3)),
                                  child: RaisedButton(
                                    elevation: 1,
                                    color: Colors.white70,
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1200)),
                                                  //this right here
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 20.0,
                                                          color: Color(
                                                              0xFFFFDE7D)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3000.0),
                                                    ),
                                                    child: RaisedButton(
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2000.0)),
                                                      onPressed: () => {
                                                        setState(() {
                                                          Timer(
                                                              Duration(
                                                                  seconds: 10),
                                                              () {
                                                            assetsAudioPlayer
                                                                .stop();
                                                            Navigator.pop(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Hom()));
                                                            print('stop');
                                                          });
                                                          assetsAudioPlayer
                                                              .open(
                                                            Audio(
                                                                "music/dangersound.mp3"),
                                                            autoStart: true,
                                                          );
                                                        }),
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 35,
                                                                right: 35),
                                                        height: 250,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            RotationTransition(
                                                              turns: Tween(
                                                                      begin:
                                                                          0.0,
                                                                      end: -.1)
                                                                  .chain(CurveTween(
                                                                      curve: Curves
                                                                          .elasticIn))
                                                                  .animate(
                                                                      _animationController),
                                                              child: Icon(
                                                                  Icons
                                                                      .notifications_active,
                                                                  size: 70,
                                                                  color: Color(
                                                                      0xFFFFDE7D)),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              'Tap to Play\n\nSiren',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFFFFDE7D),
                                                                fontSize: 20,
                                                                // fontWeight:
                                                                // FontWeight.w300,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                      _runAnimation();
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.speaker_phone,
                                          size: 40,
                                          color: HexColor("#12AB7D"),
                                        ),
                                        Text(
                                          'Siren',
                                          style: TextStyle(
                                              color: HexColor("#12AB7D"),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //(siren)
                              AvatarGlow(
                                endRadius: 70.0,
                                glowColor: HexColor("#C7C1E1"),
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      // color: Colors.transparent,
                                      border: Border.all(
                                          // color: HexColor("#ea6a88"),
                                          width: 3)),
                                  child: RaisedButton(
                                    elevation: 1,
                                    color: Colors.white70,
                                    onPressed: () {
                                      Future.delayed(
                                          const Duration(milliseconds: 5000),
                                          () {
                                        // Here you can write your code
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Hom()));
                                        print('stop');
                                      });
                                      Gradients.showMyDialog(
                                        context,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ShakeAnimatedWidget(
                                              enabled: true,
                                              duration:
                                                  Duration(milliseconds: 100),
                                              shakeAngle: Rotation.deg(z: 5),
                                              curve: Curves.linear,
                                              child: Transform.rotate(
                                                angle: (pi / 180) * -35,
                                                child: Icon(Constants.shakeIcon,
                                                    size: 70,
                                                    color: Color(0xFFFFDE7D)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Shake to capture and activate emergency',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFFFDE7D),
                                                fontSize: 20,
                                                // fontWeight:
                                                // FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        () {},
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.vibration,
                                          size: 40,
                                          color: HexColor("#12AB7D"),
                                        ),
                                        Text(
                                          'Shake',
                                          style: TextStyle(
                                              color: HexColor("#12AB7D"),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //(shake) //(shake)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          //activeIconColor:Color(0xffb72334) ,
          inactiveIconColor: Color(0xff39EAB5),
          barBackgroundColor: Color(0xFFFFDE7D),
          circleColor: Color(0xFFFFCCBC),
          tabs: [
            TabData(
                iconData: Icons.camera,
                title: "Camera",
                onclick: () {
                  final FancyBottomNavigationState fState =
                      bottomNavigationKey.currentState;
                  fState.setPage(2);
                  Navigator.pushNamed(context, PhotoCapture.route);
                }),
            TabData(
              iconData: Icons.keyboard_voice,
              title: "Voice",
              onclick: () => Navigator.pushNamed(context, SpeechScreen.route),
            ),
            TabData(
              iconData: Icons.place,
              title: "Nearby",
              onclick: () => Navigator.pushNamed(context, NearbyPlaces.route),
            ),
          ],
          initialSelection: 1,
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ),
      ),
    );
  }
}
