// Rhythm Manager - Draw Event

// Draw hit zone line
draw_set_color(c_yellow);
draw_line_width(0, hit_zone_y, room_width, hit_zone_y, 4);
draw_set_color(c_white);

// Draw score
draw_set_halign(fa_left);
draw_text(20, 20, "Score: " + string(player_score));
draw_text(20, 40, "Combo: " + string(combo));

// Draw instructions
draw_set_halign(fa_center);
draw_text(room_width / 2, room_height - 40, "Press [Z] when alarm reaches yellow line!");

// Draw feedback text
if (feedback_text != "") {
    draw_set_color(feedback_color);
    draw_text(room_width / 2, 100, feedback_text);
    draw_set_color(c_white);
}

// Reset
draw_set_halign(fa_left);