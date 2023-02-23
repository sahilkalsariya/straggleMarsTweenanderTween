import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitePage extends StatefulWidget {
  const ImplicitePage({Key? key}) : super(key: key);

  @override
  State<ImplicitePage> createState() => _ImplicitePageState();
}

class _ImplicitePageState extends State<ImplicitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implicite Animation"),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            // Up to Down  //

            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 540),
              curve: Curves.bounceOut,
              duration: Duration(milliseconds: 2300), // val
              child: Image.asset("assets/image/Maars.jpeg", width: 220), // widget
              builder: (context, double offset, widget) {
                return Transform.translate(
                  offset: Offset(0,offset),
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: Duration(milliseconds: 2000),
                    child: Image.asset("assets/image/Maars.jpeg", width: 220),
                    builder: (context, double val, widget) {
                      return Transform.rotate(
                        angle: val,
                        child:  TweenAnimationBuilder(
                          tween: ColorTween(begin: Colors.amber ,end: Colors.purple),
                          duration: Duration(milliseconds: 2000), // val
                          child: Image.asset("assets/image/Maars.jpeg", width: 220), // widget
                          builder: (context, color , widget) {
                            return ColorFiltered(colorFilter: ColorFilter.mode( color! as Color, BlendMode.modulate),
                              child: widget,
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
