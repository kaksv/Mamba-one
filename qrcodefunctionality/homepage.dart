import 'package:flutter/material.dart';
import 'package:opwalla/scan.dart';

import 'generate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OPWALLA'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
                image: NetworkImage(
                    "https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556")),
            textButton("Scan QR CODE", Scan()),
            SizedBox(
              height: 10.0,
            ),
            textButton("Generate QR CODE", Generate()),
          ],
        ),
      ),
    );
  }

  Widget textButton(String text, Widget wdget) {
    return TextButton(
      child: Text(text),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(
                    color: Colors.blue,
                    width: 3.0,
                  )))),
    );
  }

  final qrText = TextEditingController();
}
