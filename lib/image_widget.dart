import 'package:flutter/material.dart';
import 'dart:io';

class ImageWidget extends StatelessWidget {
  final String imagePath;
  const ImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(imagePath))
          )
        ),
      ),
    );
  }
}
