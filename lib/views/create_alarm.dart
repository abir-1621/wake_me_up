import 'package:flutter/material.dart';
import 'alarms.dart';

class CreateAlarmScreen extends StatefulWidget {
  @override
  _CreateAlarmScreenState createState() => _CreateAlarmScreenState();
}

class _CreateAlarmScreenState extends State<CreateAlarmScreen> {
  late String selectedGameType;
  late TimeOfDay selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Alarm'),
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
                  initialTime: TimeOfDay.now(),
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

