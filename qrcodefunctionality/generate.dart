import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  const Generate({super.key});

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  //Coding for the qr-code generating
  String qrData = "https://github.com/kaksv";

  //Setting Default Qr Code so that when you open the App the github repo welcomes you
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //We will need another plugin where you can generate Qr Code
            QrImage(
              data: qrData,
            ), //Default will be URL Data.

            //Creating how a user can make ther Qr Code.
            SizedBox(
              height: 10.0,
            ),
            Text("Get your NFT Link into Qr Code"),
            TextField(
              controller: qrText,
              decoration: InputDecoration(
                hintText: "Enter the Data Link",
              ),
              //Now we make an action Button to generate Qr Code
              //To do this only change the data of the Qr Image and state automatically will generate the Qr Code

              //We need the Text Button again
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              child: Text("GENERATE QR CODE"),
              onPressed: () {
                if (qrText.text.isEmpty) {
                  setState(() {
                    qrData = "https://flutter.dev";
                  });
                } else {
                  setState(() {
                    qrData = qrText.text;
                  });
                  //Why Do we use the setState because on Button Click, the State will change.
                  //We test the code
                }
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue, width: 3.0)))),
            ),
          ],
        ),
      ),
    );
  }

  final qrText = TextEditingController();
}

//The Qr Code Changes 
