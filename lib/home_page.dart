import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'smart_device_box.dart';
import 'smart_device_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final SmartDeviceController controller = Get.put(SmartDeviceController());

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome Home',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Sahariyar Mahmud',
                style: GoogleFonts.chelaOne(textStyle: TextStyle(fontSize: 49)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Smart Devices',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemCount: controller.smartDevices.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final powerOn = controller.smartDevices[index][2];
                    return SmartDeviceBox(
                      deviceName: controller.smartDevices[index][0],
                      iconPath: controller.smartDevices[index][1],
                      powerOn: powerOn,
                      onChanged: (value) => setState(
                        () {
                          controller.toggleSwitch(index, value);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
