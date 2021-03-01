import 'package:flutter/material.dart';

Widget card({double width = double.infinity, Widget child}) {
  return Container(
    width: width,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: child,
  );
}
