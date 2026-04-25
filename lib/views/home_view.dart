import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/logic/products_provider.dart';
import 'package:simple_ecommerce/widgets/build_list_categories.dart';
import 'package:simple_ecommerce/widgets/build_widget_internet_error.dart';
import 'package:simple_ecommerce/widgets/build_widget_is_empty_data.dart';
import 'package:simple_ecommerce/widgets/product_item.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(selectedCategoryProvider);
    final allProductsByCategory = ref.watch(productsProvider(category!));
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 25.h),
          Flexible(child: BuildListCategories()),
          Flexible(
            flex: 4,
            child: allProductsByCategory.when(
              data: (data) {
                if (data.isEmpty) {
                  return BuildWidgetIsEmptyData();
                }
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                  ),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ProductItem(product: data[index]);
                  },
                );
              },
              error: (error, stackTrace) => BuildWidgetInternetError(),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
