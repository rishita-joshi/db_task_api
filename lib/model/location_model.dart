// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  int placeId;
  String licence;
  String osmType;
  int osmId;
  String lat;
  String lon;
  String locationModelClass;
  String type;
  int placeRank;
  double importance;
  String addresstype;
  String name;
  String displayName;
  Address address;
  List<String> boundingbox;

  LocationModel({
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.lat,
    required this.lon,
    required this.locationModelClass,
    required this.type,
    required this.placeRank,
    required this.importance,
    required this.addresstype,
    required this.name,
    required this.displayName,
    required this.address,
    required this.boundingbox,
  });

  LocationModel copyWith({
    int? placeId,
    String? licence,
    String? osmType,
    int? osmId,
    String? lat,
    String? lon,
    String? locationModelClass,
    String? type,
    int? placeRank,
    double? importance,
    String? addresstype,
    String? name,
    String? displayName,
    Address? address,
    List<String>? boundingbox,
  }) =>
      LocationModel(
        placeId: placeId ?? this.placeId,
        licence: licence ?? this.licence,
        osmType: osmType ?? this.osmType,
        osmId: osmId ?? this.osmId,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        locationModelClass: locationModelClass ?? this.locationModelClass,
        type: type ?? this.type,
        placeRank: placeRank ?? this.placeRank,
        importance: importance ?? this.importance,
        addresstype: addresstype ?? this.addresstype,
        name: name ?? this.name,
        displayName: displayName ?? this.displayName,
        address: address ?? this.address,
        boundingbox: boundingbox ?? this.boundingbox,
      );

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        placeId: json["place_id"] ?? "",
        licence: json["licence"] ?? "",
        osmType: json["osm_type"] ?? "",
        osmId: json["osm_id"] ?? "",
        lat: json["lat"] ?? "",
        lon: json["lon"] ?? "",
        locationModelClass: json["class"] ?? "",
        type: json["type"] ?? "",
        placeRank: json["place_rank"] ?? "",
        importance: json["importance"]?.toDouble() ?? 0.0,
        addresstype: json["addresstype"] ?? "",
        name: json["name"] ?? "",
        displayName: json["display_name"] ?? "",
        address: Address.fromJson(json["address"] ?? ""),
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)) ?? [],
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "licence": licence,
        "osm_type": osmType,
        "osm_id": osmId,
        "lat": lat,
        "lon": lon,
        "class": locationModelClass,
        "type": type,
        "place_rank": placeRank,
        "importance": importance,
        "addresstype": addresstype,
        "name": name,
        "display_name": displayName,
        "address": address.toJson(),
        "boundingbox": List<dynamic>.from(boundingbox.map((x) => x)),
      };
}

class Address {
  String municipality;
  String county;
  String state;
  String iso31662Lvl4;
  String region;
  String country;
  String countryCode;

  Address({
    required this.municipality,
    required this.county,
    required this.state,
    required this.iso31662Lvl4,
    required this.region,
    required this.country,
    required this.countryCode,
  });

  Address copyWith({
    String? municipality,
    String? county,
    String? state,
    String? iso31662Lvl4,
    String? region,
    String? country,
    String? countryCode,
  }) =>
      Address(
        municipality: municipality ?? this.municipality,
        county: county ?? this.county,
        state: state ?? this.state,
        iso31662Lvl4: iso31662Lvl4 ?? this.iso31662Lvl4,
        region: region ?? this.region,
        country: country ?? this.country,
        countryCode: countryCode ?? this.countryCode,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        municipality: json["municipality"] ?? "",
        county: json["county"] ?? "",
        state: json["state"] ?? "",
        iso31662Lvl4: json["ISO3166-2-lvl4"] ?? "",
        region: json["region"] ?? "",
        country: json["country"] ?? "",
        countryCode: json["country_code"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "municipality": municipality,
        "county": county,
        "state": state,
        "ISO3166-2-lvl4": iso31662Lvl4,
        "region": region,
        "country": country,
        "country_code": countryCode,
      };
}
