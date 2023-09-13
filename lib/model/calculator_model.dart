// To parse this JSON data, do
//
//     final calculator = calculatorFromJson(jsonString);

import 'dart:convert';

Calculator calculatorFromJson(String str) =>
    Calculator.fromJson(json.decode(str));

String calculatorToJson(Calculator data) => json.encode(data.toJson());

class Calculator {
  String value1;
  String value2;
  String opration;
  String ans;

  Calculator({
    required this.value1,
    required this.value2,
    required this.opration,
    required this.ans,
  });

  Calculator copyWith({
    String? value1,
    String? value2,
    String? opration,
    String? ans,
  }) =>
      Calculator(
        value1: value1 ?? this.value1,
        value2: value2 ?? this.value2,
        opration: opration ?? this.opration,
        ans: ans ?? this.ans,
      );

  factory Calculator.fromJson(Map<String, dynamic> json) => Calculator(
        value1: json["value1"],
        value2: json["value2"],
        opration: json["opration"],
        ans: json["ans"],
      );

  Map<String, dynamic> toJson() => {
        "value1": value1,
        "value2": value2,
        "opration": opration,
        "ans": ans,
      };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ans': ans,
      'opration': opration,
      'value1': value1,
      'value2': value2,
    };
  }

  factory Calculator.fromMap(Map<String, dynamic> map) {
    return Calculator(
      ans: (map['ans'] ?? ''),
      opration: (map['opration'] ?? ''),
      value1: map['value1'],
      value2: map['value2'],
    );
  }
}
