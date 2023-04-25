import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nvc_coder/services/post_api.dart';

final CodeOutput _codeOutput = CodeOutput();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputcontroller = TextEditingController();
    //var codecontroller = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff282D35),
      drawer: Drawer(
        child: Container(
          color: const Color(0xff282D35),
          child: ListView(
            children: const [
              DrawerHeader(
                  child: UserAccountsDrawerHeader(
                accountEmail: Text('Compiler for NVC CS Students'),
                currentAccountPicture:
                    Image(image: AssetImage('assets/logo.png')),
                accountName: null,
              )),
              ListTile(
                title: Text(''),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff2D2C2C),
        title: const Text("NVC CODERS"),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       codecontroller.text =
          //           '//Demo c code \n#include <stdio.h>    \n                int main()\n              { \n                 // Displays the string inside quotations\n            printf(\"C Programming\");\n             return 0;\n},';
          //     },
          //     icon: const Icon(Icons.add)),
          Obx(
            () => TextButton(
                onPressed: () {
                  _codeOutput.changeLen();
                },
                child: Text(_codeOutput.leng.value)),
          )
        ],
      ),
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: TextField(
            style: const TextStyle(color: Colors.white, letterSpacing: 2.0),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textInputAction: TextInputAction.newline,
            //  controller: codecontroller,
            onChanged: (value) {
              _codeOutput.code.value = value;
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: '',
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            ),
          ),
        ),
        Positioned(
          right: 1,
          top: 20,
          child: Container(
            width: 80,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isDismissible: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      backgroundColor: Colors.black,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                color: const Color(0xff2D2C2C),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 2),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.cancel_sharp)),
                                    const SizedBox(width: 3),
                                    const Text('Output'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Obx(() => (_codeOutput.output.value ==
                                        '')
                                    ? const Text('something wrong..')
                                    : Text("root@playtanu\$\n" +
                                        _codeOutput.output.value.replaceAll(
                                            './Playground', 'playatanu/file'))),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                    _codeOutput.output.value = '...';
                    _codeOutput.debugcodeoutput(_codeOutput.code.value,
                        _codeOutput.input.value, _codeOutput.leng.value);
                  },
                  child: const Center(
                    child: Text(
                      "RUN",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ),
        ),
        Positioned(
          right: 1,
          top: 60,
          child: Container(
            width: 80,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    inputcontroller.text = _codeOutput.input.value;
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isDismissible: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      backgroundColor: Colors.black,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                color: const Color(0xff2D2C2C),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 2),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.arrow_downward),
                                    ),
                                    const SizedBox(width: 3),
                                    const Text('Inputs'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  style: const TextStyle(
                                      color: Colors.white, letterSpacing: 2.0),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  controller: inputcontroller,
                                  textInputAction: TextInputAction.newline,
                                  onChanged: (value) {
                                    _codeOutput.input.value = value;
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Center(
                    child: Text(
                      "INPUT",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ]),
    );
  }
}
