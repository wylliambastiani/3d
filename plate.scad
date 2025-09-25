// $fn = 100;

body_height = 2.5;
body_depth = 76.20;
body_length = 238.125;
body_margin = 2.52;
body_padding = 1;

screw_head_diameter = 5.7;
screw_head_height = 3.8;
screw_body_diameter = 2.86;

module plate() {
  union() {
    translate([body_padding, -body_padding, 0])
      linear_extrude(height=body_height) {
        import("plate.dxf");
      }

    translate([0, -(body_depth + (body_padding * 2)), 0])
      cube([body_padding, body_depth + (body_padding * 2), body_height]);

    translate([(body_length + body_padding), -(body_depth + (body_padding * 2)), 0])
      #cube([body_padding, body_depth + (body_padding * 2), body_height]);

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

difference() {
  plate();
  plate_cuts();
}
