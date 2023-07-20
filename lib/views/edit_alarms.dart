import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alarms.dart';

class EditAlarmScreen extends StatefulWidget {
  final Alarm alarm;

  EditAlarmScreen(this.alarm);

  @override
  _EditAlarmScreenState createState() => _EditAlarmScreenState();
}

class _EditAlarmScreenState extends State<EditAlarmScreen> {
  late String selectedGameType;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedGameType = widget.alarm.gameType;
    selectedTime = TimeOfDay.fromDateTime(DateTime.parse(widget.alarm.time));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Alarm'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Game Type:'),
            DropdownButtonFormField(
              value: selectedGameType,
              onChanged: (value) {
                setState(() {
                  selectedGameType = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'Pattern Game',
                  child: Text('Pattern Game'),
                ),
                DropdownMenuItem(
                  value: 'Math Game',
                  child: Text('Math Game'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Select Time:'),
            ElevatedButton(
              child: Text('Pick Time'),
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                );
                if (pickedTime != null) {
                  setState(() {
                    selectedTime = pickedTime;
                  });
                }
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: () {
                    if (selectedGameType != null && selectedTime != null) {
                      Navigator.pop(
                        context,
                        Alarm(selectedTime.format(context), selectedGameType),
                      );
                    }
                  },
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}