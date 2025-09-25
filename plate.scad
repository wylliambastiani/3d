$fn = 20;

body_height = 2.5;
body_depth = 76.205;
body_length = 238.125;
body_margin = 2.52;
body_padding = 0;

screw_head_diameter = 5.7;
screw_head_height = 3.8;
screw_body_diameter = 2.86;
screw_body_radius = (screw_body_diameter/2);

module plate() {
  union() {
    translate([body_padding, -body_padding, 0])
      linear_extrude(height=body_height) {
        import("plate.dxf");
      }

    translate([0, -(body_depth + (body_padding * 2)), 0])
      cube([body_padding, body_depth + (body_padding * 2), body_height]);

    translate([(body_length + body_padding), -(body_depth + (body_padding * 2)), 0])
      cube([body_padding, body_depth + (body_padding * 2), body_height]);

    translate([0,-body_padding,0])
      cube([(body_length + (body_padding * 2)), body_padding, body_height]);

    translate([0,-((body_padding * 2) + body_depth),0])
      cube([(body_length + (body_padding * 2)), body_padding, body_height]);
  }
}

module plate_cuts() {
  cut_length = 69.19 - body_margin;
  cut_depth = 21.56 - body_margin;

  translate([0, -(body_depth + (body_padding * 2)), 0])
    cube([cut_length, cut_depth, body_height]);

  translate([(body_length - cut_length + (body_padding * 2)), -(body_depth + (body_padding * 2)), 0])
    cube([cut_length, cut_depth, body_height]);
}

module screws() {
  switch_size = 14;

  // top-left
  x_start = ((2 * body_margin) + body_padding) + switch_size;
  x_step = 3 * 19;

  for (i=[x_start:x_step:90]){
    translate([i, -(screw_body_radius + 0.5 + body_margin + body_padding), 0])
      cylinder(h=body_height,r=screw_body_radius);
  }

  // top-right
  for (i=[body_length - x_start:-x_step:115]){
    translate([i, -(screw_body_radius + 0.5 + body_margin + body_padding), 0])
      cylinder(h=body_height,r=screw_body_radius);
  } 

  // bottom-left
  for (i=[x_start:x_step:90]){
    translate([i, -((2 * body_margin) + 48), 0])
      cylinder(h=body_height,r=screw_body_radius);
  }

  // bottom-right
  for (i=[body_length - x_start:-x_step:115]){
    translate([i, -((2 * body_margin) + 48), 0])
      cylinder(h=body_height,r=screw_body_radius);
  }

  // left-left
  y_start = ((2 * body_margin) + body_padding) + switch_size;
  y_step = 19;

  for (i=[y_start:y_step:50]) {
    translate([(screw_body_radius + 0.5 + body_margin + body_padding), -i, 0])
      cylinder(h=body_height,r=screw_body_radius);
  }

  // right-right
  for (i=[y_start:y_step:50]) {
    translate([(body_length - screw_body_radius - 0.5 - body_margin - body_padding), -i, 0])
      cylinder(h=body_height,r=screw_body_radius);
  }

  // super-bottom-left
  translate([85.7, -72, 0])
    #cylinder(h=body_height,r=screw_body_radius);

  translate([152.5, -72, 0])
    #cylinder(h=body_height,r=screw_body_radius);
}

difference() {
  plate();
  plate_cuts();
  screws();
}
