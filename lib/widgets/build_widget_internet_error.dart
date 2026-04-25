import 'package:flutter/material.dart';

class BuildWidgetInternetError extends StatelessWidget {
  const BuildWidgetInternetError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.wifi_off, size: 50, color: Colors.red),
        Text("Internet Error"),
      ],
    );
  }
}
