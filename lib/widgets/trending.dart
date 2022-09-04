import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../screens/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  final String name;

  const TrendingMovies({Key? key, required this.trending, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 24.0),
          child: Text(
            name,
            style: kHeadingText,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder: (BuildContext context, int index) {
              ///remember to add onTap functionalities (toast)
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (content) => Description(
                      name: trending[index]['title'],
                      bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                          trending[index]['backdrop_path'],
                      posterUrl: 'https://image.tmdb.org/t/p/w500' +
                          trending[index]['poster_path'],
                      description: trending[index]['overview'],
                      rating: trending[index]['vote_average'].toString(),
                      releaseDate: trending[index]['release_date'],
                    ),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 120.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500' +
                            trending[index]['poster_path'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
