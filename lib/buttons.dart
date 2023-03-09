import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  final color;
  final textcolor;
  final String buttonText;
  final buttontapped;

  const mybutton({this.color, this.textcolor, required this.buttonText,this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: buttontapped,
          child: Container(
            color: color,
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(color: textcolor),
            )),
          ),
        ),
      ),
    );
  }
}
