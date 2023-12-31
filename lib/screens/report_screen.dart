import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Reportbug extends StatelessWidget {
  static const String id = 'ReportBug';

  // final controllersubject = TextEditingController();
  final controllerMessage = TextEditingController();

  Reportbug({super.key});
  static const snackbarlength = SnackBar(
    duration: Duration(milliseconds: 1500),
    content: Text("Feedback or bug should be atleast 20 words"),
    backgroundColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[300],
        title: const Text("Feedback or Bug Report"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Column(
            children: [
              // buildTextFeild(title: 'Subject', controller: controllersubject),
              // const SizedBox(height: 10),
              buildTextFeild(
                  title: 'Share your Feedback or Bug Here:',
                  controller: controllerMessage,
                  maxLines: 10),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent[300],
                ),
                onPressed: (() {
                  if (controllerMessage.text.length < 20) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackbarlength);
                  } else {
                    launchEmail(
                      // subject: controllersubject.text,
                      message: controllerMessage.text,
                    );
                    controllerMessage.clear();
                    // }
                  }
                }),
                child: const Text("Send Feedback"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future launchEmail({
    // required String subject,
    required String message,
  }) async {
    final url =
        "mailto:gantanikhilraj@gmail.com?subject=Feedback or Bug Report!&body=${Uri.encodeFull(message)}";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Widget buildTextFeild({
    required String title,
    required TextEditingController controller,
    int maxLines = 1,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          TextField(
            maxLength: 1000,
            // cursorColor: Colors.black,
            enabled: true,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 10,
            // cursorHeight: 25,
            // cursorWidth: 2,
            style: const TextStyle(
              fontSize: 16,
            ),
            showCursor: true,
            textDirection: TextDirection.ltr,
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          )
        ],
      );
}
