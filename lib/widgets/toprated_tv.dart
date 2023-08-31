import 'package:flutter/material.dart';

class TopratedTv extends StatelessWidget {
  final List Tv;
  const TopratedTv({super.key, required this.Tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular TV Shows",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //add func
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      Tv[index]['backdrop_path'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            Tv[index]['original_name'] != null
                                ? Tv[index]['original_name']
                                : "Loading",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
