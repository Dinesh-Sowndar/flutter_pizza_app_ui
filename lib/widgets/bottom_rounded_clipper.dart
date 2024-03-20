import 'package:flutter/material.dart';

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 150); // Start from the bottom-left corner
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - 150); // Create a curve
    path.lineTo(size.width, 0); // Close the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Return true if clipping should be recalculated, otherwise false
  }
}
