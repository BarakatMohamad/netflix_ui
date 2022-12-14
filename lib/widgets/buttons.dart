import 'dart:core';

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function? onTap;

  const ButtonIcon({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: kTextColor,
            size: 28,
          ),
          const SizedBox(height: 6.0),
          Text(title, style: kSubTexts)
        ],
      ),
    );
  }
}

///play button
class SquareButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function? onPressed;
  final Color? color;
  final double? height;
  final double? width;

  const SquareButton(
      {Key? key,
      required this.icon,
      required this.title,
      this.onPressed,
      this.height,
      this.width,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: color,
        ),
        height: height,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: kBackground),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: kPlayButtonText,
            )
          ],
        ),
      ),
    );
  }
}
