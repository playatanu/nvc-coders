import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:nvc_coder/models/debug_code.dart';

class CodeOutput extends GetxController {
  RxString output = ''.obs;
  RxString leng = 'c'.obs;
  RxString input = ''.obs;
  RxString code = ''.obs;

  var url =
      Uri.parse("https://codexweb.netlify.app/.netlify/functions/enforceCode");

  changeLen() {
    (leng.value == 'c') ? leng.value = 'cpp' : leng.value = 'c';
  }

  debugcodeoutput(String code, String input, String language) async {
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'code': code,
        'input': input,
        'language': language,
      }),
    );
    if (response.statusCode == 200) {
      final result = DebugCode.fromJson(json.decode(response.body));
      output.value = result.output;
    } else {
      throw Exception('Failed to create this.');
    }
  }
}
