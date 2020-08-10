import 'package:flutter/material.dart';

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

  void _showAlertDialog(BuildContext context) {
    print('DialogPage: _showAlertDialog()');

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

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Simple Alert"),
      content: Text("This is an alert message."),
      actions: [okButton, cancelButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _showSimpleDialog(BuildContext context) {
    print('DialogPage: _showSimpleDialog()');

    Widget okButton = SimpleDialogOption(
      onPressed: () {
        Navigator.pop(context, 'Some result');
      },
      child: const Text('OK'),
    );

    Widget cancelButton = SimpleDialogOption(
      onPressed: () {
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
        });
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
            Text("Tap the button below to see open a dialog."),

            SizedBox(height: 20),

            //=================================
            // Alert Dialog
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
                "Alert Dialog",
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                _showAlertDialog(context);
              },
            ),

            SizedBox(height: 20),

            //=================================
            // Simple Dialog
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
              onPressed: _showSimpleDialog,
              child: Text(
                "Simple Dialog",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
