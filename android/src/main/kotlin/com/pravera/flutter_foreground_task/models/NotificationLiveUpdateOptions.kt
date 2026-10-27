package com.pravera.flutter_foreground_task.models

import com.pravera.flutter_foreground_task.PreferencesKey as PrefsKey

data class NotificationLiveUpdateOptions(
    val enabled: Boolean,
    val whenMillis: Long?,
    val usesChronometer: Boolean,
    val chronometerCountDown: Boolean,
    val category: String
) {
    companion object {
        fun fromMap(map: Map<*, *>?): NotificationLiveUpdateOptions? {
            if (map == null) return null

            return NotificationLiveUpdateOptions(
                enabled = map[PrefsKey.LIVE_UPDATE_ENABLED] as? Boolean ?: true,
                whenMillis = (map[PrefsKey.LIVE_UPDATE_WHEN] as? Number)?.toLong(),
                usesChronometer = map[PrefsKey.LIVE_UPDATE_USES_CHRONOMETER] as? Boolean ?: false,
                chronometerCountDown = map[PrefsKey.LIVE_UPDATE_CHRONOMETER_COUNT_DOWN] as? Boolean ?: false,
                category = map[PrefsKey.LIVE_UPDATE_CATEGORY] as? String ?: "workout"
            )
        }
    }
}
