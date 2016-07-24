in = 25.4;
clip_depth = .5*in;
clip_length = 1*in;
thickness = 4;

module clip(depth, length) {
    translate([2.5,0,0]) 
    union(){
      cube([depth, length, thickness]);
      rotate([0,330,0]) cube([thickness, length, 5]);
      translate([-2.5,0,4.33]) cube([thickness, length, 5]);
    }
}

clip(clip_depth, clip_length);