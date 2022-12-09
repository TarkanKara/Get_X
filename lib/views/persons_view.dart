// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, unused_local_variable, invalid_use_of_protected_member, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persons_app/model/persons.dart';
import 'package:persons_app/views_model/persons_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class PersonView extends StatelessWidget {
  const PersonView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController surname = TextEditingController();
    TextEditingController phone = TextEditingController();

    Controller controller = Get.put(Controller());
    return Scaffold(
      drawer: const Drawerr(),
      appBar: AppBar(
        title: InkWell(
            onTap: () => controller.toChangeThema(),
            child: const Text("Persons")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Center(child: Text("Add Persons")),
                      content: SizedBox(
                        height: 25.h,
                        child: Column(
                          children: [
                            TextFieldWidget(
                                controller_name: name,
                                text_name: "Add Person Name",
                                icon_data: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.person_add)),
                                textInputType: TextInputType.name,
                                suffic_icon: IconButton(
                                    onPressed: () {
                                      name.clear();
                                    },
                                    icon: const Icon(Icons.clear))),
                            SizedBox(height: 1.h),
                            TextFieldWidget(
                                controller_name: surname,
                                text_name: "Add Person Surname",
                                icon_data: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.person_add)),
                                textInputType: TextInputType.name,
                                suffic_icon: IconButton(
                                    onPressed: () {
                                      surname.clear();
                                    },
                                    icon: const Icon(Icons.clear))),
                            SizedBox(height: 1.h),
                            TextFieldWidget(
                                controller_name: phone,
                                text_name: "Enter you Number",
                                icon_data: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.phone)),
                                textInputType: TextInputType.number,
                                inputFormat: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                suffic_icon: IconButton(
                                    onPressed: () {
                                      phone.clear();
                                    },
                                    icon: const Icon(Icons.clear))),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Persons persons = Persons(
                                name: name.text,
                                surname: surname.text,
                                number: phone.text);
                            controller.addPersons(persons);
                            Get.back();
                          },
                          child: const Text("Ok"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Closed"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.person_add_sharp),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(color: Colors.purple),
                  shrinkWrap: true,
                  itemCount: controller.persons.length,
                  itemBuilder: (context, index) {
                    Persons personss = controller.persons.value[index];
                    return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text("${personss.name} ${personss.surname}"),
                        subtitle: Text("${personss.number}"),
                        trailing: IconButton(
                            onPressed: () {
                              controller.deletedPersons(personss);
                            },
                            icon: const Icon(Icons.delete)));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Drawer
class Drawerr extends StatelessWidget {
  const Drawerr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  child: const DrawerHeader(
                      child: CircleAvatar(radius: 50, child: FlutterLogo())))),
          Expanded(
              flex: 2,
              child: ListView(children: [
                ListTile(
                    title: Row(children: const [Text("Theme")]),
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
              ])),
        ],
      ),
    );
  }
}

//TextFieldWidget
class TextFieldWidget extends StatelessWidget {
  final String text_name;
  final IconButton? icon_data, suffic_icon;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormat;
  final TextEditingController? controller_name;
  const TextFieldWidget({
    Key? key,
    required this.text_name,
    required this.icon_data,
    required this.textInputType,
    this.inputFormat,
    this.controller_name,
    this.suffic_icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller_name,
      keyboardType: textInputType,
      inputFormatters: inputFormat,
      decoration: InputDecoration(
        hintMaxLines: 1,
        suffixIcon: suffic_icon,
        prefixIcon: icon_data,
        labelText: text_name,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
