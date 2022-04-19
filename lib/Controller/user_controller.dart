import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/user.dart';

class UserController extends GetxController {
  var usersList = <User>[].obs;

  Future fetchUsers() async {
    await http.Client().get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {"Accept": "application/json"},
    ).then((response) {
      if (response.statusCode.isEqual(200)) {
        usersList.value = userFromJson(response.body);
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: "Something went wrong",
            message: "API Status Code: ${response.statusCode}",
          ),
        );
        throw Exception('Failed to load users');
      }
    });
  }
}
