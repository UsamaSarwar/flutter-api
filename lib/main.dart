import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_container/tab_container.dart';
import 'View/photos_tab.dart';
import 'View/users_tab.dart';

void main() {
  /// Widgets binding
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TabContainerController _tabController =
        TabContainerController(initialIndex: 0, length: 2);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API Integration',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
      ),
      home: TabContainer(
        controller: _tabController,
        tabEdge: TabEdge.right,
        // colors: const [
        //   Colors.red,
        //   Colors.white,
        // ],
        color: Colors.grey[200],
        children: [
          UsersTab(),
          PhotosTab(),
        ],
        tabs: const [
          Icon(
            Icons.people,
            color: Colors.black,
          ),
          Icon(
            Icons.photo_library_rounded,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
