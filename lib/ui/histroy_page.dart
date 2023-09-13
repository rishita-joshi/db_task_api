import 'package:flutter/material.dart';
import 'package:version_task/model/calculator_model.dart';
import 'package:version_task/ui/location_screen.dart';

import '../config/database_helper.dart';
import '../main.dart';

class HistroyPage extends StatefulWidget {
  const HistroyPage({super.key});

  @override
  State<HistroyPage> createState() => _HistroyPageState();
}

class _HistroyPageState extends State<HistroyPage> {
  List<Calculator> cal = [];
  DataBase dataBase = DataBase();
  @override
  void initState() {
    getDataCal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: cal.length > 0
              ? ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: cal.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          "${cal[index].value1}  ${cal[index].opration.toString()}  ${cal[index].value2} = ${cal[index].ans} "),
                    );
                  })
              : Center(child: CircularProgressIndicator()),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LocationScreen()),
              );
            },
            child: Text("Next")),
        SizedBox(
          height: 50,
        ),
      ],
    ));
  }

  void getDataCal() async {
    List<Calculator> data = [];
    data = await dataBase.getData();
    setState(() {
      cal.addAll(data);
    });
  }
}
