import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const TimelineAppointmentHeight());


class TimelineAppointmentHeight extends StatelessWidget {
  const TimelineAppointmentHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: Container(
                height: 700,
                child: SfCalendar(
                  view:CalendarView.timelineDay,
                  allowedViews: const [
                    CalendarView.timelineDay,
                    CalendarView.timelineWeek,
                    CalendarView.timelineWorkWeek,
                    CalendarView.timelineMonth
                  ],
                  timeSlotViewSettings:
                  const TimeSlotViewSettings(timelineAppointmentHeight: 300),
                  dataSource: _getCalendarDataSource(),
                ),
              ))
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 2)),
      subject: 'Meeting',
      color: Colors.teal,
    ));

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}