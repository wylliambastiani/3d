
body_depth = 76.21;
body_length = 238.13;
body_margin = 2.52;
body_padding = 5;

screw_head_diameter = 5.7;
screw_head_height = 3.8;
screw_body_diameter = 2.86;

module plate() {
  translate([body_padding, -body_padding, 0])
  linear_extrude(height=2.5) {
    import("plate.dxf");
  }
}

module plate_cuts() {
  cut_length = 69.20 - body_margin;
  cut_depth = 21.58 - body_margin;

  translate([0, -(body_depth + 0), 0])
    #cube([cut_length, cut_depth, 2.5]);
}

difference() {
  plate();
  plate_cuts();
}
