import 'package:flutter/material.dart';
import 'package:version_task/api/api_handler.dart';
import 'package:version_task/model/location_model.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<LocationModel> locationModel = [];
  var firstLat = TextEditingController();
  var secondLat = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'Please Enter Longitude';
                  }
                },
                decoration: InputDecoration(hintText: "Enter lattitude"),
                controller: firstLat,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'Please Enter Longitude';
                  }
                },
                decoration: InputDecoration(hintText: "Enter  Longitude"),
                controller: secondLat,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      getLocationDetails(firstLat.text, secondLat.text);
                    } else {
                      print("not valid");
                    }
                  },
                  child: Text("Get Address")),
              SizedBox(
                height: 30,
              ),
              locationModel.isEmpty
                  ? Text("No Data Found")
                  : Expanded(
                      child: ListView.builder(
                          itemCount: locationModel.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ListTile(
                                  title: Text(
                                      "Display Name: ${locationModel[index].displayName}"),
                                ),
                                ListTile(
                                  title: Text(
                                      "country: ${locationModel[index].address.country}"),
                                ),
                                ListTile(
                                  title: Text(
                                      "state: ${locationModel[index].address.state}"),
                                ),
                                ListTile(
                                  title: Text(
                                      "Name: ${locationModel[index].name}"),
                                ),
                                ListTile(
                                  title:
                                      Text("lat: ${locationModel[index].lat}"),
                                ),
                                ListTile(
                                  title:
                                      Text("long: ${locationModel[index].lon}"),
                                ),
                              ],
                            );
                          }),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  getLocationDetails(String firstLat, String secondLat) async {
    HttPConfig.callLocationDetails(firstLat, secondLat).then(
      (value) {
        setState(() {
          locationModel.add(value);
        });
      },
    );
  }
}
