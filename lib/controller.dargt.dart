import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeController extends GetxController {
  TextEditingController txtdate =TextEditingController();
  TextEditingController txttime =TextEditingController();

  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  var selectedValue = 1.obs;
  Duration selectedDuration = Duration();
  void onDurationChanged(Duration newDuration) {
      selectedDuration = newDuration;
  }
  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    if (picked != null && picked != selectedTime.value) {
      selectedTime.value = picked;
    }
  }
  void select(int value) {
    selectedValue.value = value; // update the value
  }




}
