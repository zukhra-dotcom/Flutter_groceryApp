import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/component/main_header.dart';
import 'package:grocery_app/controller/controllers.dart';
import 'package:grocery_app/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:grocery_app/view/home/components/popular_categories/popular_category_card_loading.dart';
import 'package:grocery_app/view/home/components/section_title.dart';

import 'components/carousel_slider/carousel_loading.dart';
import 'components/popular_categories/popular_category.dart';
import 'components/popular_categories/popular_category_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const MainHeader(),
        Obx(() {
          if (homeController.bannerList.isNotEmpty) {
            return CarouselSliderView(
                bannerList: homeController.bannerList
            );
          } else {
            return const CarouselLoading();
          }
        }),
        const SectionTitle(title: "Popular Category"),
        Obx(() {
          if (homeController.popularCategoryList.isNotEmpty) {
            return PopularCategory(
              categories: homeController.popularCategoryList
            );
          } else {
            return const PopularCategoryLoading();
          }
        }),
      ],
    ));
  }
}
