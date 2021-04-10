import 'package:avatar_glow/avatar_glow.dart';
import 'package:blobs/blobs.dart';
import 'package:flash_animation/flash_animation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:safety/pages/emergency_dashboard.dart';
import 'package:safety/ui/homescreen.dart';

class Switcher extends StatelessWidget {
  static final String route = '/switcher';
  final FlashAnimation anim = FlashAnimation(
    gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
    child: Text('Hi'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [HexColor('#fa922a'), HexColor('#FFDE7D')])),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),

              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homes()));
                },
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(context).size.width / 15, 0, 0),
                        child: AvatarGlow(
                          endRadius: 130.0,
                          glowColor: Colors.blueAccent,
                          child: SizedBox(
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Blob.animatedRandom(
                        size: 295,
                        edgesCount: 5,
                        minGrowth: 4,
                        loop: true,
                        styles: BlobStyles(
                          color: Colors.blueAccent[100],
                          fillType: BlobFillType.fill,
                          strokeWidth: 3,
                        ),
                      ),
                    ),
                    Center(
                        child: Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(0,
                                MediaQuery.of(context).size.width / 3.5, 0, 0),
                            child: Text(
                              'Safe',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black54),
                            ))),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                autofocus: false,
                onPressed: () {
                  Navigator.pushNamed(context, Hom.route);
                },
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(context).size.width / 15, 0, 0),
                        child: AvatarGlow(
                          endRadius: 130.0,
                          glowColor: Colors.deepOrange,
                          child: SizedBox(
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Blob.animatedRandom(
                        size: 295,
                        edgesCount: 5,
                        minGrowth: 4,
                        loop: true,
                        styles: BlobStyles(
                          color: Colors.deepOrange[300],
                          fillType: BlobFillType.fill,
                          strokeWidth: 3,
                        ),
                      ),
                    ),
                    Center(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(0,
                                MediaQuery.of(context).size.width / 3.5, 0, 0),
                            child: Text(
                              'Danger',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black54),
                            ))),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
