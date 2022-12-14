import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/content_model.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Previews({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(title, style: kHeadingText),
        ),
        SizedBox(
          height: 165.0,
          child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              ///extract contents
              final Content contents = contentList[index];
              return GestureDetector(
                ///remember to add toast widget to all the console print
                onTap: () => print(contents.name),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(contents.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: contents.color!, width: 4.0),
                      ),
                    ),

                    ///gradient container for clarity of the titleImageUrl
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black45,
                              Colors.transparent,
                            ],

                            ///end of the gradient
                            stops: [
                              0,
                              0.25,
                              1
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                        shape: BoxShape.circle,
                        border: Border.all(color: contents.color!, width: 4.0),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: 60,
                        child: Image.asset(contents.titleImageUrl!),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
