// Alarm Note - Step Event

// Scroll upward
y -= scroll_speed;

// Get manager reference with safety check
if (!instance_exists(obj_rhythm_manager)) {
    exit;
}

var manager = instance_find(obj_rhythm_manager, 0);

if (manager == noone) {
    exit;
}

// Check if in hit zone
var in_hit_zone = (y >= manager.hit_zone_y - manager.hit_zone_range) && 
                  (y <= manager.hit_zone_y + manager.hit_zone_range);

// Check for Z key press
if (keyboard_check_pressed(ord("Z")) && in_hit_zone && !is_toggled) {
    // Calculate timing accuracy
    var timing_diff = abs(y - manager.hit_zone_y);
    
    if (timing_diff <= manager.perfect_threshold) {
        // PERFECT!
        manager.player_score += 100;
        manager.combo++;
        manager.show_feedback("PERFECT!", c_yellow);
        
        // Play sound if exists
        audio_play_sound(snd_toggle_hit, 1, false);
        
    } else if (timing_diff <= manager.good_threshold) {
        // GOOD
        manager.player_score += 50;
        manager.combo++;
        manager.show_feedback("GOOD", c_lime);
        
        // Play sound if exists
        audio_play_sound(snd_toggle_hit, 1, false);
    }
    
    // Toggle the alarm
    is_toggled = true;
}

// Check if missed (passed hit zone without toggling)
if (y < manager.hit_zone_y - manager.hit_zone_range && !is_toggled && !missed) {
    manager.combo = 0;
    manager.show_feedback("MISS", c_red);
    missed = true;
}

// Destroy if off screen
if (y < -sprite_height) {
    instance_destroy();
}