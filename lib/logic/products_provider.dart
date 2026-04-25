import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:simple_ecommerce/core/constants/app_strings.dart';
import 'package:simple_ecommerce/data/model/product.dart';
import 'package:simple_ecommerce/data/repository/get_products_repository.dart';
import 'package:simple_ecommerce/data/service/get_products_web_service.dart';

final productsRepoProvider = Provider<GetProductsRepository>(
  (ref) =>
      GetProductsRepository(getProductsWebService: GetProductsWebService()),
);

final selectedCategoryProvider = StateProvider<String?>(
  (ref) => AppStrings.categories.first,
);

final productsProvider = FutureProvider.family<List<Product>, String>((
  ref,
  category,
) async {
  final repo = ref.read(productsRepoProvider);
  return repo.getProductsByCategory(category);
});
