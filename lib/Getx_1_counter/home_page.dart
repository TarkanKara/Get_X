// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:flutter/material.dart';
import 'package:persons_app/Getx_1_counter/controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //Controller sınıfındaki kodlarımızı tüm sayfalarımızda kullanabilmek için
    final Controller controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Tıklanma : ${controller.count}"))),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Get.to(const SecondPage());
              },
              child: const Text("Diğer Sayfa Geç"))),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.icrement();
          },
          child: const Icon(Icons.add)),
    );
  }
}

//Second Page
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Diğer syafalardan conroller sınıfının özelliklerine erişebilme
    final Controller controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Center(child: Text("Second Page Tıklanma : ${controller.count}")),
    );
  }
}
