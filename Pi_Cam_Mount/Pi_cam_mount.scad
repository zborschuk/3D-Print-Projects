cam_thickness  = 1;
cam_hole_distance = 15.35;
cam_width = 25;
mounting_hole_rad = 1.75;
frame_thickness = 6.4;
frame_bump = 2.85;
mount_thickness = 2;
slop = .2;
$fn=180;

union() {
    difference () {
        cube([30,30,12]);
        translate([-0.01, mount_thickness, -0.1])
        cube([31,frame_thickness+slop,10.1]);
        translate([frame_bump, frame_thickness+slop-0.01,-0.1])
        cube([frame_thickness+slop, 30, 10.1]);
        translate([frame_bump+frame_thickness+mount_thickness+slop, mount_thickness*2+frame_thickness+slop,-0.1])
        cube([20,20,20]);
    }
    translate([-18.5,-3.5,10])
    rotate([0,0,-45])
    cube([20,30,2]);
    translate([-20,-20,0]) {
    difference() {
        translate([0,18,11.9])
        rotate([-3,0,-45]) {
            difference() {
        cube([cam_width, mount_thickness, 15]);
        translate([6.5,-.1,11.5])
            rotate([90,0,0])
            cylinder(r=mounting_hole_rad, h=5,center=true);
                translate([6.5+cam_hole_distance-mounting_hole_rad*2, -0.1,11.5])
                rotate([90,0,0])
                cylinder(r=mounting_hole_rad, h=5,center=true);
            }
        }
        
    }
}
}