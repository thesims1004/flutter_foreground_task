/// Android 16+ promoted ongoing notification (Live Update) options.
///
/// Unsupported Android versions ignore these values and keep showing the
/// regular foreground-service notification.
class NotificationLiveUpdateOptions {
  const NotificationLiveUpdateOptions({
    this.enabled = true,
    this.when,
    this.usesChronometer = false,
    this.chronometerCountDown = false,
    this.category = 'workout',
  });

  /// Whether the notification requests promoted ongoing treatment.
  final bool enabled;

  /// Base time used by Android's system chronometer.
  final DateTime? when;

  /// Whether [when] is rendered as a chronometer instead of a timestamp.
  final bool usesChronometer;

  /// Whether the chronometer counts down instead of up.
  final bool chronometerCountDown;

  /// Android notification category. Workout tracking should use `workout`.
  final String category;

  Map<String, dynamic> toJson() => {
    'enabled': enabled,
    'when': when?.millisecondsSinceEpoch,
    'usesChronometer': usesChronometer,
    'chronometerCountDown': chronometerCountDown,
    'category': category,
  };
}
