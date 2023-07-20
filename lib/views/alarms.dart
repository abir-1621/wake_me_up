import 'package:flutter/material.dart';

import 'alarm_detail.dart';
import 'create_alarm.dart';

class Alarm {
  final String time;
  final String gameType;

  Alarm(this.time, this.gameType);
}

class AlarmListScreen extends StatefulWidget {
  @override
  _AlarmListScreenState createState() => _AlarmListScreenState();
}

class _AlarmListScreenState extends State<AlarmListScreen> {
  List<Alarm> alarms = [];

  @override
  void initState() {
    super.initState();
    // Load alarms from storage or initialize with default values
    alarms = [
      Alarm('08:00 AM', 'Pattern Game'),
      Alarm('09:30 AM', 'Math Game'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarms'),
      ),
      body: ListView.builder(
        itemCount: alarms.length,
        itemBuilder: (context, index) {
          final alarm = alarms[index];
          return ListTile(
            title: Text(alarm.time),
            subtitle: Text(alarm.gameType),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlarmDetailsScreen(alarm),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateAlarmScreen(),
            ),
          ).then((newAlarm) {
            if (newAlarm != null) {
              setState(() {
                alarms.add(newAlarm);
              });
            }
          });
        },
      ),
    );
  }
}
