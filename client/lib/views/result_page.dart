import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nvc_coder/services/post_api.dart';

final CodeOutput _codeOutput = CodeOutput();

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(_codeOutput.output.value);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xff282D35),
      body: Column(
        children: [
          Obx(() => Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, bottom: 20, right: 20),
                child: Text(
                  _codeOutput.output.value,
                  style: const TextStyle(color: Colors.white),
                ),
              ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
                  child: SingleChildScrollView(
                    child: Text(
                      ' _codeOutput.output.value _codeOutput.output.value _codeOutput.output.value _codeOutput.output.value',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
