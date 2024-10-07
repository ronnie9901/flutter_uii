
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uii/controller.dargt.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
var timeController = Get.put(TimeController());
class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: timeController.txtdate,

              decoration: InputDecoration(
              labelText: 'dd/mm/yy' ,
                suffixIcon: InkWell(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      barrierColor: Colors.red,
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (picked != null) {
                      timeController.txtdate.text =
                          "${picked.day}-${picked.month}-${picked.year}";
                    }
                  },
                  child: Icon(Icons.date_range),
                ),
                enabledBorder: OutlineInputBorder()

              ),

            ),
            SizedBox(height: 10,),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Obx(() => Text("Selected time: ${timeController.selectedTime.value.format(context)}",style: TextStyle(fontSize: 20),)), // React to changes
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final TimeOfDay? picked = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      if (picked != null) {
                        timeController.selectedTime.value = picked;
                        timeController.txttime.text = "${picked.hour}:${picked.minute}";
                      }
                    },
                    child: Text('Pick Time'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => AlertDialog.adaptive(
                      title: Divider(),
                      actions: [
                        SingleChildScrollView(
                          child: Column(
                           mainAxisSize: MainAxisSize.min, children: [
                              ListTile(
                                title: Text('Option 1'),
                                leading: Obx(() => Radio(
                                      value: 1,
                                      groupValue: timeController.selectedValue
                                          .value, // Get the observable value
                                      onChanged: (value) {
                                        timeController.select(
                                            value!); // Update the selected value
                                      },
                                    )),
                              ),
                              ListTile(
                                title: Text('Option 2'),
                                leading: Obx(() => Radio(
                                      value: 2,
                                      groupValue: timeController.selectedValue
                                          .value, // Get the observable value
                                      onChanged: (value) {
                                        timeController.select(
                                            value!); // Update the selected value
                                      },
                                    )),
                              ),
                              ListTile(
                                title: Text('Option 3'),
                                leading: Obx(() => Radio(
                                      value: 3,
                                      groupValue: timeController.selectedValue
                                          .value, // Get the observable value
                                      onChanged: (value) {
                                        timeController.select(
                                            value!); // Update the selected value
                                      },
                                    )),
                              ),
                              ListTile(
                                title: Text('Option 4'),
                                leading: Obx(() => Radio(
                                  value: 4,
                                  groupValue: timeController.selectedValue
                                      .value, // Get the observable value
                                  onChanged: (value) {
                                    timeController.select(
                                        value!); // Update the selected value
                                  },
                                )),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Divider(),
                        TextButton(onPressed: () {
                          Navigator.of(context).pop();
                        }, child: Text('cancel'))
                      ],
                    ),
                  );
                },
                child: Text('alert dialog box')),
            ElevatedButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => Dialog.fullscreen(
                        child: CupertinoDatePicker(
                      onDateTimeChanged: (value) {},
                    )),
                  );
                },
                child: Text('Dialog Box')),
            ElevatedButton(onPressed: () {
             showModalBottomSheet(context: context, builder: (context) =>Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 CupertinoTimerPicker(
                   mode: CupertinoTimerPickerMode.hms,
                   initialTimerDuration: timeController.selectedDuration,
                   onTimerDurationChanged: (Duration newDuration) {
                     timeController.onDurationChanged(newDuration);
                   },
                 ),
                 Padding(
                   padding: EdgeInsets.all(8.0),
                   child: ElevatedButton(
                     onPressed: () {
                       Navigator.pop(context); // Close the bottom sheet
                     },
                     child: Text('ok'),
                   ),
                 ),
               ],
             ),
             );}, child: Text('Selected time: ${timeController.selectedDuration.inHours} hours,'

                ' ''${timeController.selectedDuration.inMinutes % 60} minutes,'
                ' ''${timeController.selectedDuration.inSeconds % 60} seconds',
            ),)

          ],
        ),
      ),
    );
  }
}
