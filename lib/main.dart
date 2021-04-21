import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Calculator",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double firstNum, secNum;
  String display = '', result, operation, history = '';
  void btnOnClick(String btnValue) {
    if (btnValue == "AC") {
      firstNum = 0;
      secNum = 0;
      display = '';
      result = '';
      history = '';
    } else if (btnValue == "C") {
      firstNum = 0;
      secNum = 0;
      display = '';
      result = '';
    } else if (btnValue == "/" ||
        btnValue == "X" ||
        btnValue == "-" ||
        btnValue == "+") {
      operation = btnValue;
      firstNum = double.parse(display);
      result = '';
    } else if (btnValue == "=") {
      secNum = double.parse(display);
      if (operation == "/") {
        result = (firstNum / secNum).toString();
        history =
            firstNum.toString() + operation.toString() + secNum.toString();
      }
      if (operation == "X") {
        result = (firstNum * secNum).toString();
        history =
            firstNum.toString() + operation.toString() + secNum.toString();
      }
      if (operation == "-") {
        result = (firstNum - secNum).toString();
        history =
            firstNum.toString() + operation.toString() + secNum.toString();
      }
      if (operation == "+") {
        result = (firstNum + secNum).toString();
        history =
            firstNum.toString() + operation.toString() + secNum.toString();
      }
    } else if (btnValue == "<") {
      result = display.substring(0, display.length - 1);
    } else if (btnValue == "+/-") {
      if (display[0] != "-") {
        result = "-" + display;
      } else {
        result = display.substring(1);
      }
    } else if (btnValue == ".") {
      if (display.contains(".")) {
        result = display;
      } else if (display == "") {
        result = (0).toString() + ".";
      } else {
        result = display + ".";
      }
    } else {
      result = double.parse(display + btnValue).toString();
    }
    setState(() {
      display = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        leading: Icon(Icons.adb),
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(
                  0, 0, MediaQuery.of(context).size.width * 0.05, 0),
              child: Text(
                history,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 28,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height * 0.02,
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.02),
              child: Text(
                display,
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer("AC", Colors.orange),
                buildContainer("C", Colors.orange),
                buildContainer("<", Colors.orange),
                buildContainer("/", Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer("9", Colors.teal),
                buildContainer("8", Colors.teal),
                buildContainer("7", Colors.teal),
                buildContainer("X", Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer("6", Colors.teal),
                buildContainer("5", Colors.teal),
                buildContainer("4", Colors.teal),
                buildContainer("-", Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer("3", Colors.teal),
                buildContainer("2", Colors.teal),
                buildContainer("1", Colors.teal),
                buildContainer("+", Colors.orange),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer("+/-", Colors.teal),
                buildContainer("0", Colors.teal),
                buildContainer(".", Colors.teal),
                buildContainer("=", Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(no, color) {
    return Container(
      margin: EdgeInsets.all(
        MediaQuery.of(context).size.height * 0.02,
      ),
      width: MediaQuery.of(context).size.width * 0.18,
      height: MediaQuery.of(context).size.height * 0.10,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: color,
          onSurface: Colors.grey,
        ),
        child: Text(
          no,
          style: TextStyle(fontSize: 24),
        ),
        onPressed: () {
          btnOnClick(no);
        },
      ),
    );
  }
}
