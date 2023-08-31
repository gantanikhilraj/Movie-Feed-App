import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, launchOn, vote;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.launchOn,
      required this.vote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerUrl, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text("Rating " + vote,
                          style: TextStyle(color: Colors.white)))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                name != null ? name : "laoding",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "released on" + launchOn != null ? launchOn : "laoding",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterUrl),
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      description != null ? description : "loading",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
