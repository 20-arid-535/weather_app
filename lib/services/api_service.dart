import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_app/const/api_const.dart';
import 'package:weather_app/model/api_model.dart';

class ApiService {
  static Future<ApiModel?> getData({city="Rawalpindi"}) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.Endpoint+"${city}");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        ApiModel _model = apiModelFromJson(response.body);
        print(_model.current.tempC.toString());
        return _model;
      }
    } catch (e) {
       
      log(e.toString());
    }
  }

}