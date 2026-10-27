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
    this.shortCriticalText,
    this.category = 'workout',
    this.useProgressStyle = false,
    this.progressIndeterminate = false,
    this.progress = 0,
  }) : assert(progress >= 0 && progress <= 100);

  /// Whether the notification requests promoted ongoing treatment.
  final bool enabled;

  /// Base time used by Android's system chronometer.
  final DateTime? when;

  /// Whether [when] is rendered as a chronometer instead of a timestamp.
  final bool usesChronometer;

  /// Whether the chronometer counts down instead of up.
  final bool chronometerCountDown;

  /// Short text for Android's compact status chip (recommended: <= 7 chars).
  final String? shortCriticalText;

  /// Android notification category. Workout tracking should use `workout`.
  final String category;

  /// Whether Android 16+ should render this live update using ProgressStyle.
  ///
  /// Older Android versions keep using the regular notification style.
  final bool useProgressStyle;

  /// Whether the progress amount is unknown while the activity is ongoing.
  final bool progressIndeterminate;

  /// Progress from 0 to 100 when [progressIndeterminate] is false.
  final int progress;

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        'when': when?.millisecondsSinceEpoch,
        'usesChronometer': usesChronometer,
        'chronometerCountDown': chronometerCountDown,
        'shortCriticalText': shortCriticalText,
        'category': category,
        'useProgressStyle': useProgressStyle,
        'progressIndeterminate': progressIndeterminate,
        'progress': progress,
      };
}
