import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(200),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        errorWidget: (context, url, error) => SizedBox(
          width: 50,
          child: Center(
            child: const Icon(
              Icons.error,
              color: Colors.orangeAccent,
            ),
          ),
        ),
        fit: BoxFit.contain,
      ),
    );
  }
}
