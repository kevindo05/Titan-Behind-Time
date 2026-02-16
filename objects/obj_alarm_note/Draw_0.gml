// Alarm Note - Draw Event

// Draw the alarm sprite
draw_self();

// Draw alarm time text
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_text(x + 10, y + 10, alarm_time);

// Draw toggle sprite
if (is_toggled) {
    draw_sprite(spr_toggle_on, 0, x + sprite_width - 40, y + sprite_height / 2 - 16);
} else {
    draw_sprite(spr_toggle_off, 0, x + sprite_width - 40, y + sprite_height / 2 - 16);
}

// Draw [Z] prompt if in hit zone (with safety check)
if (instance_exists(obj_rhythm_manager)) {
    var manager = instance_find(obj_rhythm_manager, 0);
    
    if (manager != noone) {
        var in_hit_zone = (y >= manager.hit_zone_y - manager.hit_zone_range) && 
                          (y <= manager.hit_zone_y + manager.hit_zone_range);

        if (in_hit_zone && !is_toggled) {
            draw_set_color(c_yellow);
            draw_set_halign(fa_center);
            draw_text(x + sprite_width / 2, y - 20, "[Z]");
        }
    }
}

// Reset draw settings
draw_set_color(c_white);
draw_set_halign(fa_left);