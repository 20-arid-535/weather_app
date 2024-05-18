// To parse this JSON data, do
//  api https://api.weatherapi.com/v1/current.json?key=af7eddffcf0e4a0b930173757242004&q=Rawalpindi
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

String apiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel {
   Location location;
   Current current;

    ApiModel({
        required this.location,
        required this.current,
    });

    factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
    };
}

class Current {
    num lastUpdatedEpoch;
    String lastUpdated;
    num tempC;
    num tempF;
    int isDay;
    Condition condition;
    num windMph;
    num windKph;
    num windDegree;
    String windDir;
    num pressureMb;
    num pressureIn;
    num precipMm;
    num precipIn;
    num humidity;
    num cloud;
    num feelslikeC;
    num feelslikeF;
    num visKm;
    num visMiles;
    num uv;
    num gustMph;
    num gustKph;

    Current({
        required this.lastUpdatedEpoch,
        required this.lastUpdated,
        required this.tempC,
        required this.tempF,
        required this.isDay,
        required this.condition,
        required this.windMph,
        required this.windKph,
        required this.windDegree,
        required this.windDir,
        required this.pressureMb,
        required this.pressureIn,
        required this.precipMm,
        required this.precipIn,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.feelslikeF,
        required this.visKm,
        required this.visMiles,
        required this.uv,
        required this.gustMph,
        required this.gustKph,
    });

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"]?.toDouble(),
        tempF: json["temp_f"]?.toDouble(),
        isDay: json["is_day"]?.toInt(),
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"]?.toDouble(),
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"]?.toDouble(),
        pressureIn: json["pressure_in"]?.toDouble(),
        precipMm: json["precip_mm"]?.toDouble(),
        precipIn: json["precip_in"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        cloud: json["cloud"]?.toDouble(),
        feelslikeC: json["feelslike_c"]?.toDouble(),
        feelslikeF: json["feelslike_f"]?.toDouble(),
        visKm: json["vis_km"]?.toDouble(),
        visMiles: json["vis_miles"]?.toDouble(),
        uv: json["uv"]?.toDouble(),
        gustMph: json["gust_mph"]?.toDouble(),
        gustKph: json["gust_kph"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
    };
}

class Condition {
    String text;
    String icon;
    num code;

    Condition({
        required this.text,
        required this.icon,
        required this.code,
    });

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
    };
}

class Location {
    String name;
    String region;
    String country;
    num lat;
    num lon;
    String tzId;
    num localtimeEpoch;
    String localtime;

    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"]?.toDouble(),
        localtime: json["localtime"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
    };
}
