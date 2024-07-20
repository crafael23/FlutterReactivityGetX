import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _homePageControl = Get.put(HomePageController());

  TextEditingController _searchQueryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Obx(() => _homePageControl.isSearching.value
              ? BackButton(
                  onPressed: () {
                    _homePageControl.isSearching.value = false;
                  },
                )
              : Container()),
          title: Obx(() => _homePageControl.isSearching.value
              ? TextField(
                  controller: _searchQueryController,
                  onChanged: (value) {
                    _homePageControl.search.value = value;
                  },
                )
              : const Text("Search")),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                _homePageControl.isSearching.value = true;
              },
            ),
          ],
        ),
        body: Center(
          child: Obx(() => Text(_homePageControl.search.value)),
        ));
  }
}
