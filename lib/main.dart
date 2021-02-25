import 'package:flutter/material.dart';
import 'Input.dart';
import 'Convert.dart';
import 'Result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final suhu = TextEditingController();
  double _inputSuhu = 0;
  double _kelvin = 0;
  double _reamur = 0;

  void _perhitungansuhu() {
    setState(() {
      // _inputSuhu = double.parse(suhu.text);
      _inputSuhu = double.parse(suhu.text);
      _kelvin = _inputSuhu + 273;
      _reamur = (4 / 5) * _inputSuhu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(suhu: suhu),
              Result(kelvin: _kelvin, reamur: _reamur),
              Convert(konvertHandler: _perhitungansuhu),
            ],
          ),
        ),
      ),
    );
  }
}
