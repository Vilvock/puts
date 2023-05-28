import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Secondary extends StatefulWidget {
  const Secondary({Key? key}) : super(key: key);

  @override
  State<Secondary> createState() => _First();
}

class _First extends State<Secondary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'images/2.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: double.infinity,
                          child: Card(
                              elevation: 0,
                              color: Colors.white,
                              margin: EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      "ora ora, parece que o guarda real n gostou da sua resposta, vamos tentar de novo?")))),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          color: Colors.white,
                          child: Row(
                            children: [
/*                              Container(
                                padding: EdgeInsets.all(20),
                                child: Icon(
                                  size: 24,
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                    child: Wrap(
                                      children: [
                                        GestureDetector(
                                            onTap: () => {},
                                            child: Text(
                                              "naum",
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 14,
                                                color: Colors.red,
                                              ),
                                            )),
                                      ],
                                    ),
                                  )),
                              Container(
                                child: VerticalDivider(
                                  color: Colors.white,
                                  width: 2,
                                  thickness: 1.5,
                                ),
                              ),*/
                              Container(
                                padding: EdgeInsets.all(20),
                                child: Icon(
                                  color: Colors.white,
                                  size: 24,
                                  Icons.shopping_cart_outlined,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                      child: Wrap(children: [
                                        GestureDetector(
                                          onTap: () => {

                                          Navigator.of(context).pop()
                                          },
                                          child: Text("si",
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 14,
                                              )),
                                        ),
                                      ])))
                            ],
                          ))
                    ],
                  ))
            ],
          ),
        ));
  }

}
