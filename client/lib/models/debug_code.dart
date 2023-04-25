import 'dart:convert';

DebugCode debugCodeFromJson(String str) => DebugCode.fromJson(json.decode(str));

String debugCodeToJson(DebugCode data) => json.encode(data.toJson());

class DebugCode {
  DebugCode({
    required this.sourceCode,
    required this.status,
    required this.errorCode,
    this.error,
    required this.outputType,
    required this.output,
    this.outputStyle,
    required this.date,
    required this.language,
    required this.input,
    required this.id,
  });

  String sourceCode;
  int status;
  int errorCode;
  dynamic error;
  int outputType;
  String output;
  dynamic outputStyle;
  DateTime date;
  String language;
  String input;
  int id;

  factory DebugCode.fromJson(Map<String, dynamic> json) => DebugCode(
        sourceCode: json["sourceCode"],
        status: json["status"],
        errorCode: json["errorCode"],
        error: json["error"],
        outputType: json["outputType"],
        output: json["output"],
        outputStyle: json["outputStyle"],
        date: DateTime.parse(json["date"]),
        language: json["language"],
        input: json["input"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "sourceCode": sourceCode,
        "status": status,
        "errorCode": errorCode,
        "error": error,
        "outputType": outputType,
        "output": output,
        "outputStyle": outputStyle,
        "date": date.toIso8601String(),
        "language": language,
        "input": input,
        "id": id,
      };
}
