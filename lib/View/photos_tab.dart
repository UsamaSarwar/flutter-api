import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/photo_controller.dart';

class PhotosTab extends StatelessWidget {
  PhotosTab({Key? key}) : super(key: key);
  final PhotoController _photoController = Get.put(PhotoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // Show Images
      // from API
      body: FutureBuilder(
        future: _photoController.fetchImages(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Obx(
              () => Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.isPortrait ? 4 : 10,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: _photoController.imagesList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: CachedNetworkImage(
                        // imageUrl: _photoController.imagesList[index].url,
                        imageUrl: 'https://usamasarwar.github.io/favicon.png', // Testing URL
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator.adaptive()),
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                      ),

                      //* Alternative Way to fetch Images
                      // child: Image.network(
                      //   _photoController.imagesList[index].url,
                      //   fit: BoxFit.contain,
                      //   scale: 1,
                      //   errorBuilder: (BuildContext context, Object exception,
                      //       StackTrace? stackTrace) {
                      //     return const Center(child: Icon(Icons.error));
                      //   },
                      // ),
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
