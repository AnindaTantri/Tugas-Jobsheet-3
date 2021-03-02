import 'package:flutter/material.dart';
import 'Input.dart';
import 'Convert.dart';
import 'Result.dart';
import 'Riwayat.dart';

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
  String _newValue = "Kelvin";
  List<String> history = [];
  double _result = 0;

  void _perhitungansuhu() {
    setState(() {
      _inputSuhu = double.parse(suhu.text);
      if (_newValue == "Kelvin") {
        _result = _inputSuhu + 273;
        listViewItem.add('Kelvin : ' + (_result).toString());
      } else {
        listViewItem.add('Reamur : ' + (_result).toString());
        _result = (4 / 5) * _inputSuhu;
      }
    });
  }

  var listItem = ["Kelvin", "Reamur"];
  List<String> listViewItem = List<String>();

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
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue = changeValue;
                    _perhitungansuhu();
                  });
                },
              ),
              Result(result: _result),
              Convert(konvertHandler: _perhitungansuhu),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Riwayat(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
