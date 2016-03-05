inch=25.4;
bar_rad=.75*inch;
mount_width=1*inch;
mount_thickness=1*inch;
slop=.2;
halves_separation=3;

m5_head_rad=5+slop;
m5_thread_rad=2.5+slop;
m5_thread_thickness=.8;
m5_locknut_height=5;
m5_locknut_rad=(8/cos(180/6))/2;

m3_thread_rad=2;
m3_locknut_height=4;
m3_locknut_width=(5.5/cos(180/6));

$fn=360;
handlebar_mount();
module handlebar_mount() {
    difference() {
        base_object();
        
        // handlebar cutout
        cylinder(h=mount_width+slop, r=bar_rad+slop, center=true);
        cube([halves_separation,2*(bar_rad+mount_thickness+slop)+slop,mount_width+slop],center=true);
        
        // M5 Hole cutouts
        translate([0,bar_rad+slop+(mount_thickness/2), 0]) rotate([0,90,0]) cylinder(h=mount_width*3+slop,r=m5_thread_rad,center=true);
        translate([0,-(bar_rad+slop+(mount_thickness/2)), 0]) rotate([0,90,0]) cylinder(h=mount_width*3+slop,r=m5_thread_rad,center=true);
        
        // Socket Head Cutouts
        translate([bar_rad/2+slop, -(bar_rad+slop+(mount_thickness/2)),0]) rotate([0,90,0]) cylinder(h=mount_width*2+slop,r=m5_head_rad+slop);
        translate([bar_rad/2+slop, (bar_rad+slop+(mount_thickness/2)),0]) rotate([0,90,0]) cylinder(h=mount_width*2+slop,r=m5_head_rad+slop);
        
        // M5 Locknut Cutouts
        translate([-11.5,(bar_rad+slop+(mount_thickness/2)), 0]) rotate([0,-90,0]) cylinder(h=mount_width,r1=m5_locknut_rad,r2=m5_locknut_rad+slop,$fn=6);
        translate([-11.5,-(bar_rad+slop+(mount_thickness/2)), 0]) rotate([0,-90,0]) cylinder(h=mount_width,r1=m5_locknut_rad,r2=m5_locknut_rad+slop,$fn=6);
        
        // M3 Hole cutout
        translate([bar_rad+mount_thickness+slop-5, bar_rad+mount_thickness+slop, 0]) rotate([90,00,0]) cylinder(h=20, r=m3_thread_rad+slop, center=true);
        
        // M3 Locknut Cutout
        translate([bar_rad+mount_thickness+slop-5, bar_rad+mount_thickness+slop-m3_locknut_height-1, 0]) rotate([90,0,0]) cylinder(h=m3_locknut_height+2, r1=(m3_locknut_width/2),r2=((m3_locknut_width)/2)+slop, $fn=6, center=true);
        
    }
}

// Just to make sure locknut doesn't impede M5 bolt
/*render() {
    translate([bar_rad+mount_thickness+slop-5, bar_rad+mount_thickness+slop-m3_locknut_height, 0]) rotate([90,0,0]) cylinder(h=m3_locknut_height+slop, r=(m3_locknut_width/2)+slop, $fn=6, center=true);}*/


module base_object(){
    union(){
        cylinder(h=mount_width, r=bar_rad+mount_thickness+slop, center=true);
        translate([0,0,-(mount_width)/2])
        cube([bar_rad+mount_thickness+slop, bar_rad+mount_thickness+slop,mount_width]);
    }
}
