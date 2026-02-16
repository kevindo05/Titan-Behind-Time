// Rhythm Manager - Step Event

// Update song position
song_position += delta_time / 1000000;

// Spawn alarms at regular intervals
spawn_timer += delta_time / 1000000;

if (spawn_timer >= spawn_interval) {
    spawn_timer = 0;
    
    // Random chance to spawn (70% chance = spawn most of the time, with some gaps)
    var spawn_chance = 0.7; // Adjust between 0.0 and 1.0
    
    if (random(1) < spawn_chance) {
        // Create new alarm at bottom of screen (CENTERED for 300px wide sprite)
        var new_alarm = instance_create_layer(room_width / 2 - 150, room_height + 50, "Instances", obj_alarm_note);
        new_alarm.alarm_time = string(irandom(11) + 1) + ":00 PM";
    }
    // else: skip this beat - creates a gap!
}

// Update feedback timer
if (feedback_timer > 0) {
    feedback_timer -= delta_time / 1000000;
    if (feedback_timer <= 0) {
        feedback_text = "";
    }
}