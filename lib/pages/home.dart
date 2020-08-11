// interesting stuff here: https://androidkt.com/flutter-alertdialog-example/

import 'package:flutter/material.dart';
import '../classes/custom-dialog.dart';

class DialogPage extends StatefulWidget {
  DialogPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  void initState() {
    print('DialogPage: initState()');
    super.initState();
  }

  void _showDialogImmediate(BuildContext context) {
    // https://medium.com/@excogitatr/custom-dialog-in-flutter-d00e0441f1d5
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: "Dialog (Immediate)",
        description:
            "Ribeye pork loin andouille biltong. Cow pig pancetta pork belly drumstick chuck porchetta pork loin bacon. Buffalo jowl drumstick porchetta fatback andouille.",
        buttonText: "OK",
      ),
    );
  }

  Future<void> _showDialogWait(BuildContext context) async {
    // https://medium.com/@excogitatr/custom-dialog-in-flutter-d00e0441f1d5
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: "Dialog (Wait)",
        description:
            "Ribeye pork loin andouille biltong. Cow pig pancetta pork belly drumstick chuck porchetta pork loin bacon. Buffalo jowl drumstick porchetta fatback andouille. ",
        buttonText: "OK",
      ),
    );
  }

  void _showAlertDialogRaised(BuildContext context) {
    Widget okButton = RaisedButton(
      child: Text("OK"),
      onPressed: () {
        print('OK tapped');
        Navigator.of(context).pop();
      },
    );

    Widget cancelButton = RaisedButton(
      child: Text("Cancel"),
      onPressed: () {
        print('Cancel tapped');
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Simple Alert"),
      content: Text("This is an alert message."),
      actions: [okButton, cancelButton],
    );

    showDialog(
      context: context,
      barrierDismissible: false, // user must tap a button to close the dialog
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _showAlertDialogFlat(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        print('OK tapped');
        Navigator.of(context).pop();
      },
    );

    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        print('Cancel tapped');
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Simple Alert"),
      content: Text("This is an alert message."),
      actions: [okButton, cancelButton],
    );

    showDialog(
      context: context,
      barrierDismissible: false, // user must tap a button to close the dialog
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> _alertWaitFlat(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert (Wait)'),
          content: const Text(
              'Ribeye pork loin andouille biltong. Cow pig pancetta pork belly drumstick chuck porchetta pork loin bacon. Buffalo jowl drumstick porchetta fatback andouille.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                print('OK tapped');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _alertWaitRaised(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert (Wait)'),
          content: const Text(
              'Ribeye pork loin andouille biltong. Cow pig pancetta pork belly drumstick chuck porchetta pork loin bacon. Buffalo jowl drumstick porchetta fatback andouille.'),
          actions: <Widget>[
            RaisedButton(
              child: Text('Ok'),
              onPressed: () {
                print('OK tapped');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSimpleDialog(BuildContext context) {
    Widget okButton = SimpleDialogOption(
      onPressed: () {
        print('OK tapped');
        Navigator.pop(context, 'Some result');
      },
      child: const Text('OK'),
    );

    Widget cancelButton = SimpleDialogOption(
      onPressed: () {
        print('Cancel tapped');
        Navigator.pop(context, 'Some other result');
      },
      child: const Text('Cancel'),
    );

    SimpleDialog simpDialog = SimpleDialog(
      title: const Text('This is a simple dialog'),
      children: <Widget>[okButton, cancelButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return simpDialog;
      },
    );
  }

  Future<void> _showSimpleDialogWait(BuildContext context) {
    Widget okButton = SimpleDialogOption(
      onPressed: () {
        print('OK tapped');
        Navigator.pop(context, 'Some result');
      },
      child: const Text('OK'),
    );

    Widget cancelButton = SimpleDialogOption(
      onPressed: () {
        print('Cancel tapped');
        Navigator.pop(context, 'Some other result');
      },
      child: const Text('Cancel'),
    );

    SimpleDialog simpDialog = SimpleDialog(
      title: const Text('This is a simple dialog'),
      children: <Widget>[okButton, cancelButton],
    );

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return simpDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            SizedBox(height: 10),
            Text(
                "Tap one of the buttons below to display the corresponding dialog."),

            SizedBox(height: 20),
            //=================================
            // Dialog (immediate)
            //=================================
            RaisedButton(
              color: Colors.blueGrey,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              splashColor: Colors.blueAccent,
              onPressed: () {
                print('Start');
                _showDialogImmediate(context);
                print('Done');
              },
              child: Text(
                "Dialog (Immediate)",
                style: TextStyle(fontSize: 20.0),
              ),
            ),

            SizedBox(height: 20),
            // =================================
            // Dialog (wait)
            // =================================
            RaisedButton(
              color: Colors.blueGrey,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              splashColor: Colors.blueAccent,
              onPressed: () {
                print('Start');
                _showDialogWait(context).then((value) => {print('Done')});
              },
              child: Text(
                "Dialog (Wait)",
                style: TextStyle(fontSize: 20.0),
              ),
            ),

            SizedBox(height: 20),
            //=================================
            // Alert Dialog (Raised)
            //=================================
            RaisedButton(
              color: Colors.redAccent,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              splashColor: Colors.blueAccent,
              child: Text(
                "Alert Dialog (Raised)",
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                print('Start');
                _showAlertDialogRaised(context);
                print('Done');
              },
            ),

            SizedBox(height: 20),
            //=================================
            // Alert Dialog (Flat)
            //=================================
            RaisedButton(
              color: Colors.redAccent,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              splashColor: Colors.blueAccent,
              child: Text(
                "Alert Dialog (Flat)",
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                print('Start');
                _showAlertDialogFlat(context);
                print('Done');
              },
            ),

            SizedBox(height: 20),
            //=================================
            // Alert Dialog (Flat, Wait)
            //=================================
            RaisedButton(
              color: Colors.orangeAccent,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              splashColor: Colors.blueAccent,
              child: Text(
                "Alert Dialog (Flat, Wait)",
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                print('Start');
                _alertWaitFlat(context).then((value) => {print('Done')});
              },
            ),

            SizedBox(height: 20),
            //=================================
            // Alert Dialog (Raised, Wait)
            //=================================
            RaisedButton(
              color: Colors.orangeAccent,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              splashColor: Colors.blueAccent,
              child: Text(
                "Alert Dialog (Raised, Wait)",
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                print('Start');
                _alertWaitRaised(context).then((value) => {print('Done')});
              },
            ),

            SizedBox(height: 20),
            //=================================
            // Simple Dialog
            //=================================
            RaisedButton(
              color: Colors.grey,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              splashColor: Colors.blueAccent,
              onPressed: () {
                print('Start');
                _showSimpleDialog(context);
                print('Done');
              },
              child: Text(
                "Simple Dialog",
                style: TextStyle(fontSize: 20.0),
              ),
            ),

            SizedBox(height: 20),
            //=================================
            // Simple Dialog (Wait)
            //=================================
            RaisedButton(
              color: Colors.grey,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              splashColor: Colors.blueAccent,
              onPressed: () {
                print('Start');
                _showSimpleDialogWait(context).then((value) => {print('Done')});
              },
              child: Text(
                "Simple Dialog (Wait)",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
