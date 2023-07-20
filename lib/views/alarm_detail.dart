import 'package:flutter/material.dart';
import 'package:wake_me_up/views/create_alarm.dart';

import 'alarms.dart';
import 'edit_alarms.dart';

class AlarmDetailsScreen extends StatelessWidget {
  final Alarm alarm;

  AlarmDetailsScreen(this.alarm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm Details'),
      ),
      body: Column(
        children: [
          Text('Time: ${alarm.time}'),
          Text('Game Type: ${alarm.gameType}'),
          ElevatedButton(
            child: Text('Edit Alarm'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditAlarmScreen(alarm),
                ),
              ).then((editedAlarm) {
                if (editedAlarm != null) {
                  // Update the alarm in the list
                }
              });
            },
          ),
          ElevatedButton(
            child: Text('Delete Alarm'),
            onPressed: () {
              // Show confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Delete Alarm'),
                    content: Text(
                        'Are you sure you want to delete this alarm?'),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text('Delete'),
                        onPressed: () {
                          Navigator.pop(context);
                          // Delete the alarm from the list
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
