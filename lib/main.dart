import 'dart:io';
import "package:hive/hive.dart";
import "package:path_provider/path_provider.dart";
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.openBox<String>("friends");
  runApp(MyApp());
  //runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = new FocusNode();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Hive"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: TextButton(
                  child: Text("Show"),
                  onPressed: () {},
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Builder(
                  builder: (context) {
                    return TextButton(
                      child: Text("Add"),
                      onPressed: () {
                        showDialog(
                          context: context,
                          //barrierDismissible: false,
                          builder: (_) => AlertDialog(
                            title: Text("Adding"),
                            content: Container(
                              height: MediaQuery.of(context).size.height / 5,
                              child: Column(
                                children: [
                                  TextField(
                                    focusNode: focusNode,
                                    controller: _idController,
                                    decoration:
                                        InputDecoration(hintText: "ID number"),
                                  ),
                                  TextField(
                                   
                                    controller: _nameController,
                                    decoration:
                                        InputDecoration(hintText: "Name"),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    focusNode.unfocus();
                                  },
                                  child: Text("Cancel")),
                              TextButton(
                                  onPressed: () {
                                    focusNode.unfocus();
                                  },
                                  child: Text("Add")),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                TextButton(
                  child: Text("Update"),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text("Delete"),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
