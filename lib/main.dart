
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:puts/screens/1.dart';
import 'package:puts/screens/2.dart';
import 'package:puts/screens/3.dart';
import 'package:puts/screens/4.dart';


void main() async {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Piuts",
    initialRoute: '/ui/1',
    routes: {
      '/ui/1': (context) => First(),
      '/ui/2': (context) => Secondary(),
      '/ui/3': (context) => Third(),
      '/ui/4': (context) => Fourth(),

      //lista horizontal
      // Container(
      //   height: 180,
      //   child: ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: /*numbersList.length*/ 2,
      //     itemBuilder: (context, index) {
      //       return Card(
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(
      //               Dimens.minRadiusApplication),
      //         ),
      //         margin:
      //             EdgeInsets.all(Dimens.minMarginApplication),
      //         child: Container(
      //           width: MediaQuery.of(context).size.width * 0.80,
      //           padding:
      //               EdgeInsets.all(Dimens.paddingApplication),
      //         ),
      //       );
      //     },
      //   ),
      // ),
    },
  ));
}
