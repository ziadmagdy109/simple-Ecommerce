import 'package:flutter/material.dart';

class BuildWidgetIsEmptyData extends StatelessWidget {
  const BuildWidgetIsEmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.inventory_2_outlined, size: 70, color: Colors.grey),
        SizedBox(height: 12),
        Text("No products found in this category."),
      ],
    );
  }
}
