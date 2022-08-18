import 'dart:math';
import 'package:http/http.dart' as http;

class FetchData {
  getData(
    int area,
    int bedrooms,
    double? psf,
    // ignore: non_constant_identifier_names
    int feature_score,
    double? locationPremium,
  ) async {
    var logPremium = log(locationPremium!);
    String url =
        'http://192.168.0.160:8000//predict?area=$area&bedrooms=$bedrooms&psf=$psf&feature_score=$feature_score&LocationPremium=$locationPremium&LogPremium=$logPremium';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
