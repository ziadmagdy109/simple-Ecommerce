import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/constants/app_strings.dart';

class GetProductsWebService {
  late Dio dio;
  GetProductsWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 5),
      connectTimeout: Duration(seconds: 5),
      sendTimeout: Duration(seconds: 5),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getProductsByCategory(String category) async {
    final allCategory = await dio.get("products/category/$category");
    return allCategory.data["products"];
  }
}
