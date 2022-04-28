import 'package:flutter/material.dart';
import 'package:flutter_app/passcode.dart';

import './passcode_handler.dart';

class Landing extends StatelessWidget {

  List<int> pass = [];

  void awaitPasscode(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PasscodeHandler("Set Passcode")),
    );
    pass = result;
  }

  void awaitAuth(BuildContext context) async {
    final result =  await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PasscodeHandler("Enter Passcode")),
    );
    bool match = true;
    for (int i = 0; i < pass.length; i++) {
      if (pass[i] != result[i]) match = false;
    }

    if (match) {
      var successDialog = AlertDialog(
        title: Text("Success!")
      );
      showDialog(context: context, builder: (BuildContext context) {
        return successDialog;
      });
    } else {
      var badDialog = AlertDialog(
          title: Text("Failure!")
      );
      showDialog(context: context, builder: (BuildContext context) {
        return badDialog;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
//    print
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passcode Thingy'),
      ),
      body: Column (
        children: [
          Container(
            margin: EdgeInsets.only(top: 150, bottom: 30),
            child: Center(
              child: ElevatedButton(
                onPressed: () => awaitPasscode(context),
                child: const Text('Set Passcode'),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                awaitAuth(context);
              },
              child: const Text('Authenticate Code'),
            ),
          ),
        ],
      )
    );
  }
}