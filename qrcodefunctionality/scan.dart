import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String qrResult = "Not Yet Scanned";
  //We are to update this string as the Qr Scans the QR CODE
  
  //by changing the state of the string.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "RESULT",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrResult,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              child: Text("SCAN QR CODE"),
              onPressed: () async {
                //Here we scan the QR Code.
                var scanning = await BarcodeScanner.scan();
                setState(() {
                  qrResult = scanning.toString();
                });
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
}
//When You Click on Scan, the Camera opens and you scan.

