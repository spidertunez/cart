import 'package:flutter/material.dart';



class BorderChangeWidget extends StatefulWidget {
  const BorderChangeWidget({super.key});

  @override
  _BorderChangeWidgetState createState() => _BorderChangeWidgetState();
}

class _BorderChangeWidgetState extends State<BorderChangeWidget> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
      },
      child: Container(
        width: 30,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: _isTapped ? Colors.grey : Colors.black,
            width: 3.0,
          ),
        ),
      ),
    );
  }
}
