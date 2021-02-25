import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required double kelvin,
    @required double reamur,
  })  : _kelvin = kelvin,
        _reamur = reamur,
        super(key: key);

  final double _kelvin;
  final double _reamur;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              // children: [Text("Suhu dalam Kelvin"), Text("$_inputUser")],
              children: [Text("Suhu dalam Kelvin"), Text("$_kelvin")],
            ),
            margin: EdgeInsets.all(8),
          ),
          Container(
            child: Column(
              children: [Text("Suhu dalam Reamur"), Text("$_reamur")],
            ),
            margin: EdgeInsets.all(8),
          ),
        ],
      ),
    );
  }
}
