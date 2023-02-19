import 'package:dio/dio.dart' as httpDio;
import '../models/place_data_model.dart';
import 'endpoints.dart';

class ApiProvider {
  httpDio.Dio dio = httpDio.Dio();

  Future<PlaceData?> getPlaceData(String? name) async {
    PlaceData? placeData;
    try {
      httpDio.Response response = await dio.get('${Endpoints.baseURL}${Endpoints.textsearchURL}$name');
      print('api=${Endpoints.baseURL}${Endpoints.textsearchURL}$name');
      placeData = PlaceData.fromJson(response.data);
    } on httpDio.DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
      } else {
        print(e.message);
      }
    }
    return placeData;
  }

}