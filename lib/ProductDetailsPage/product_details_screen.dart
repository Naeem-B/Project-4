import 'package:flutter/material.dart';
import 'package:project_4/HomePage/components/app_bar_widget.dart';

import 'components/details_page_main_widget.dart';
import 'components/details_screen_app_bar.dart';
import 'components/product_background_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: detailsScreenAppBar(),
      body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DetailsPageMainWidget()),
    );
  }
}