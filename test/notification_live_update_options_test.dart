import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('serializes promoted ongoing chronometer options', () {
    final when = DateTime.fromMillisecondsSinceEpoch(1234567890000);
    final options = NotificationLiveUpdateOptions(
      when: when,
      usesChronometer: true,
      shortCriticalText: '12:34',
      useProgressStyle: true,
      progressIndeterminate: true,
    );

    expect(options.toJson(), {
      'enabled': true,
      'when': 1234567890000,
      'usesChronometer': true,
      'chronometerCountDown': false,
      'shortCriticalText': '12:34',
      'category': 'workout',
      'useProgressStyle': true,
      'progressIndeterminate': true,
      'progress': 0,
    });
  });

  test(
    'can disable promoted treatment while retaining fallback notification',
    () {
      const options = NotificationLiveUpdateOptions(enabled: false);

      expect(options.toJson(), {
        'enabled': false,
        'when': null,
        'usesChronometer': false,
        'chronometerCountDown': false,
        'shortCriticalText': null,
        'category': 'workout',
        'useProgressStyle': false,
        'progressIndeterminate': false,
        'progress': 0,
      });
    },
  );
}
