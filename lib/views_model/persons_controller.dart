// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/persons.dart';

class Controller extends GetxController {
  RxList persons = [].obs;
  RxBool isTheme = false.obs;

  addPersons(Persons addd) {
    persons.add(addd);
  }

  deletedPersons(Persons removee) {
    persons.remove(removee);
  }

  toChangeThema() {
    isTheme.value = !isTheme.value;
    isTheme.value
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.purple)));
  }
}
