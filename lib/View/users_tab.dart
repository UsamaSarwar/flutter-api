import 'package:flutter/material.dart';
import 'package:flutterapi/Controller/user_controller.dart';
import 'package:get/get.dart';

class UsersTab extends StatelessWidget {
  UsersTab({Key? key}) : super(key: key);
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // Show Users from API
      body: FutureBuilder(
        future: _userController.fetchUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: _userController.usersList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.account_circle_rounded),
                          title: Text(_userController.usersList[index].name),
                          subtitle:
                              Text(_userController.usersList[index].email),
                          trailing: IconButton(
                              onPressed: () {
                                // User Details
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(_userController
                                            .usersList[index].name),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(_userController
                                                .usersList[index].email),
                                            Text(_userController
                                                .usersList[index].phone),
                                            Text('www.'+_userController
                                                .usersList[index].website),
                                            Text(_userController
                                                    .usersList[index]
                                                    .address
                                                    .street +
                                                ', ' +
                                                _userController.usersList[index]
                                                    .address.suite +
                                                ', ' +
                                                _userController.usersList[index]
                                                    .address.city),
                                            Text(_userController
                                                .usersList[index]
                                                .address
                                                .zipcode),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text("Close"),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.touch_app_rounded)),
                        ),
                      );
                    },
                  ),
                ));
          } else if (snapshot.hasError) {
            Get.showSnackbar(GetSnackBar(
              title: "Something went wrong",
              message: "${snapshot.error}",
            ));
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
