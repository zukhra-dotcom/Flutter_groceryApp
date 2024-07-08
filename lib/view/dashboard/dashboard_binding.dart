import 'package:get/get.dart';
import 'package:grocery_app/controller/dashboard_controller.dart';
import 'package:grocery_app/controller/home_contoller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DashboardControler());
    Get.put(HomeController());
  }
}