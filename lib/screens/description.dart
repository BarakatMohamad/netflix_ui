import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/buttons.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, rating, releaseDate;

  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.releaseDate,
    required this.posterUrl,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: ListView(
        children: [
          SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            margin: const EdgeInsets.all(5),
            child: Text(
              name != null ? name : "Name unavailable",
              style: kMovieTitle,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              children: [
                Text("⭐ Average Rating - " + rating, style: kSubTexts),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SquareButton(
            icon: Icons.play_arrow,
            title: 'Play',
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          SquareButton(
            icon: Icons.arrow_circle_down,
            title: 'Download',
            width: 10.0,
            color: Colors.white30,
          ),
          // Container(
          //   margin: EdgeInsets.all(5),
          //   child: Text(
          //     "Overview",
          //     style: kHeadingText,
          //   ),
          // ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                width: 100,
                height: 200,
                child: Image.network(
                  posterUrl,
                ),
              ),
              Container(
                child: Flexible(
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: kMovieDesc,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Text(
              "Release Date: " + releaseDate,
              style: kHeadingText,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: const Text(
              "Cast",
              style: kHeadingText,
            ),
          ),
        ],
      ),
    );
  }
}
