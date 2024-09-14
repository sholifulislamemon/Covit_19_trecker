import 'dart:async';

import 'package:covid19/screen/world_screen.dart';
import 'package:flutter/material.dart';
 import 'dart:math' as math ;

import 'package:flutter/rendering.dart';
class Splasscreen extends StatefulWidget {
  const Splasscreen({super.key});

  @override
  State<Splasscreen> createState() => _SplasscreenState();
}

class _SplasscreenState extends State<Splasscreen> with TickerProviderStateMixin  {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 3),
      vsync: this) ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer( Duration(seconds: 3),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => WorldScreen(),));
    } ,);
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(animation: _controller,
                child: Container(
                  height: size.height *.4,
                  width: size.width * .6,
                  child:Center(
                    child:Image(
                      image:AssetImage("assets/image/virus.png", ),
                  ),
                  ),
                ),
                builder:( BuildContext Context, Widget?child){

              return Transform.rotate(
                  angle: _controller.value *2.0*math.pi,
              child:child ,);
            }),
            Align(
                alignment:Alignment.center,
                child: Text("Covid 19 \n Trecker App", textAlign:TextAlign.center,style: TextStyle( color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30 ),))
      
          ],
        ),
      ),
    );

  }
}
