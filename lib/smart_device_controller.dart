import 'package:get/get.dart';

class SmartDeviceController extends GetxController {
  final List<List> smartDevices = [
    ['Smart Light', 'assets/icons/light-bulb.png', true],
    ['Smart Ac', 'assets/icons/air-conditioner.png', false],
    ['Smart Tv', 'assets/icons/smart-tv.png', false],
    ['Smart Fan', 'assets/icons/fan.png', false],
  ].obs;

  void toggleSwitch(int index, bool value) {
  smartDevices[index][2] = value;
}

}
