import 'package:flutter/material.dart';
import 'package:version_task/model/calculator_model.dart';
import 'package:version_task/ui/histroy_page.dart';

import '../config/database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

DataBase db = DataBase();
List items = ["ADD", "MIN", "DIV", "MUL"];

String selectedValue = "ADD";
final _formKey = GlobalKey<FormState>();

class _HomePageState extends State<HomePage> {
  var firstValueController = TextEditingController();
  var SecondValueController = TextEditingController();
  var displayValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Please Enter Value 1';
                    }
                  },
                  decoration: InputDecoration(hintText: "Enter Value 1"),
                  controller: firstValueController,
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Please Enter Value 2';
                    }
                  },
                  decoration: InputDecoration(hintText: "Enter Value 2"),
                  controller: SecondValueController,
                  keyboardType: TextInputType.number,
                ),
                DropdownButton(
                  value: selectedValue,
                  hint: Text("Select Opration"),
                  items: items.map<DropdownMenuItem<String>>((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      oprationPerform();
                    },
                    child: Text("Calculate")),
                Text(displayValue.toString()),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistroyPage()),
                      );
                    },
                    child: Text("Histroy")),
              ]),
        ),
      ),
    );
  }

  void oprationPerform() {
    if (_formKey.currentState!.validate()) {
      switch (selectedValue) {
        case 'ADD':
          setState(() {
            displayValue = int.parse(firstValueController.text) +
                int.parse(SecondValueController.text);

            var cal = Calculator(
                value1: firstValueController.text,
                value2: SecondValueController.text,
                opration: "+",
                ans: displayValue.toString());
            db.insert(cal.toJson());
          });
          break;
        case 'MIN':
          setState(() {
            displayValue = int.parse(firstValueController.text) -
                int.parse(SecondValueController.text);

            var cal = Calculator(
                value1: firstValueController.text,
                value2: SecondValueController.text,
                opration: "-",
                ans: displayValue.toString());
            db.insert(cal.toJson());
          });

        case 'DIV':
          setState(() {
            displayValue = int.parse(firstValueController.text) /
                int.parse(SecondValueController.text);

            var cal = Calculator(
                value1: firstValueController.text,
                value2: SecondValueController.text,
                opration: "/",
                ans: displayValue.toString());

            db.insert(cal.toJson());
          });
          break;
        case 'MUL':
          setState(() {
            displayValue = int.parse(firstValueController.text) *
                int.parse(SecondValueController.text);

            var cal = Calculator(
                value1: firstValueController.text,
                value2: SecondValueController.text,
                opration: "*",
                ans: displayValue.toString());
            db.insert(cal.toJson());
          });
          break;
        default:
          displayValue = int.parse(firstValueController.text) +
              int.parse(SecondValueController.text);
          var cal = Calculator(
              value1: firstValueController.text,
              value2: SecondValueController.text,
              opration: "+",
              ans: displayValue.toString());
          db.insert(cal.toJson());
      }
    } else {
      print("Form not Validate");
    }
    setState(() {
      firstValueController.text = "";
      SecondValueController.text = "";
    });
  }
}
