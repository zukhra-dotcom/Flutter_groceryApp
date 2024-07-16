import 'package:flutter/material.dart';
import 'package:grocery_app/component/main_header.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            const MainHeader(),
            Expanded(child: Container())
          ],
        ),
    );
  }
}
