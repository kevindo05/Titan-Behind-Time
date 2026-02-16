// Rhythm Manager - Create Event

// Song timing
song_position = 0;
bpm = 120;
beat_interval = 60 / bpm; // 0.5 seconds per beat

// Spawn timing
spawn_timer = 0;
spawn_interval = beat_interval * 2;

// Scoring
player_score = 0;
combo = 0;

// Hit zone position
hit_zone_y = room_height / 2;
hit_zone_range = 30;

// Perfect/Good timing thresholds
perfect_threshold = 15;
good_threshold = 30;

// Feedback variables
feedback_text = "";
feedback_color = c_white;
feedback_timer = 0;

// Helper function to show feedback
function show_feedback(text, color) {
    feedback_text = text;
    feedback_color = color;
    feedback_timer = 1.0;
}

// Play background music
audio_play_sound(snd_rhythm_bgm, 1, true);