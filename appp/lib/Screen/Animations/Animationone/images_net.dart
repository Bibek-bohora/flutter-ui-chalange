import 'package:flutter/material.dart';

class PnImageNetwor extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double? height;
  final double? width;
  const PnImageNetwor(
      {super.key,
      required this.image,
      required this.fit,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: fit,
    );
  }
}
