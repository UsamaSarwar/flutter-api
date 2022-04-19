import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/photo.dart';

class PhotoController extends GetxController {
  var imagesList = <Photo>[].obs;

  Future fetchImages() async {
    await http.Client().get(
      Uri.parse('https://picsum.photos/v2/list'),
      headers: {"Accept": "application/json"},
    ).then((response) {
      if (response.statusCode.isEqual(200)) {
        imagesList.value = photoFromJson(response.body);
      } else {
        Get.showSnackbar(GetSnackBar(
          title: "Something went wrong",
          message: "API Status Code: ${response.statusCode}",
        ));
        throw Exception('Failed to load Photo');
      }
    });
  }
}
