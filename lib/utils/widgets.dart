import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/global_variables.dart';


class pageButton extends StatelessWidget {
  const pageButton({
    super.key,
    required this.bc,
    required this.margin,
    required this.func,
    required this.text,
    required this.c,
    required this.width,
    required this.height,
    required this.tc
  });
  final Color bc;
  final Color c;
  final Color tc;

  final String text;
  final double width;
  final double height;
  final Function func;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(
          color: bc, // Kenarlık rengi
          width: 2, // Kenarlık kalınlığı
        ),
      ),
      child: TextButton(
        child: Container(child: Text(text, textAlign: TextAlign.center, style: TextStyle(color: tc, fontSize: screenheight / 20))),
        onPressed: () {
          func();
        },
      ),
    );
  }
}