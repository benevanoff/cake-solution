import 'package:flutter/material.dart';
import './passcode.dart';

class PasscodeHandler extends StatefulWidget {
  String title;
  PasscodeHandler(this.title);
  @override
  State<PasscodeHandler> createState() => _PasscodeHandlerState();
}

class _PasscodeHandlerState extends State<PasscodeHandler> {
  void listener(List<int> l) {
    if (l.length == 6) {
      Navigator.pop(context, l);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Passcode(listener)
      ),
    );
  }
}