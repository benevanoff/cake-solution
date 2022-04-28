import 'package:flutter/material.dart';

class Passcode extends StatefulWidget {
  final Function(List<int>) callFunc;
  Passcode(this.callFunc);
  @override
  State<Passcode> createState() => _PasscodeState();
}

class _PasscodeState extends State<Passcode> {

  String passcode_stars = " ";
  List<int> nums = [];

  void enterNum(int num) {
    setState(() {
      passcode_stars = passcode_stars + " *";
      passcode_stars = passcode_stars.trim();
      nums.add(num);
      widget.callFunc(nums);
    });
  }

  void backSpace() {
    setState(() {
      passcode_stars = passcode_stars.substring(0, passcode_stars.length-2);
      passcode_stars = passcode_stars.trim();
      nums.removeLast();
      widget.callFunc(nums);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Text(passcode_stars),
        ),
        Expanded(child:
        GridView.count(
          primary: true,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            OutlinedButton(
              child: Text("1"),
              onPressed: () => enterNum(1),
            ),
            OutlinedButton(
              child: Text("2"),
              onPressed: () => enterNum(2),
            ),
            OutlinedButton(
              child: Text("3"),
              onPressed: () => enterNum(3),
            ),
            OutlinedButton(
              child: Text("4"),
              onPressed: () => enterNum(4),
            ),
            OutlinedButton(
              child: Text("5"),
              onPressed: () => enterNum(5),
            ),
            OutlinedButton(
              child: Text("6"),
              onPressed: () => enterNum(6),
            ),
            OutlinedButton(
              child: Text("7"),
              onPressed: () => enterNum(7),
            ),
            OutlinedButton(
              child: Text("8"),
              onPressed: () => enterNum(8),
            ),
            OutlinedButton(
              child: Text("9"),
              onPressed: () => enterNum(9),
            ),
            OutlinedButton(
              child: Text(" "),
              onPressed: null,
            ),
            OutlinedButton(
              child: Text("0"),
              onPressed: () => enterNum(0),
            ),
            OutlinedButton(
              child: Text("<"),
              onPressed: () => { backSpace() },
            ),
          ],
        )
        )
      ],
    );
  }
}