import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/component/main_header.dart';
import 'package:grocery_app/controller/controllers.dart';
import 'package:grocery_app/view/home/components/carousel_slider/carousel_slider_view.dart';

import 'components/carousel_slider/carousel_loading.dart';

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
            return CarouselLoading();
          }
        })
      ],
    ));
  }
}
