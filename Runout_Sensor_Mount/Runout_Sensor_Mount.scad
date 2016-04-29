in = 25.4;
slop = 0.2;
filament_guide = 2.2;
$fn=100;
m3_locknut_height=4;
m3_locknut_width=5.5/cos(180/6);

case_group();
//translate([23.5,2,2])
//rotate([0,0,-5])
//#flap();
translate([40,0,0])
//rotate([0,180,0])
lid();


module lid() {
    union() {
        cube([28,28,2]);
       
        translate([4,2,1.9])
        cube([22,23,2.5]);
    }
}

module case() {
    union() {
        translate([5,7,1.9])
        cube([2,3,4]);
    translate([5,15.5,1.9])
        cube([2,3,4]);
        difference(){
    translate([9,28,0])
    cube([10,10,4]);
            translate([14,33,4])
    cylinder(h=m3_locknut_height, r=5.5/2+slop,center=true);
            translate([14,33,0])
            cylinder(h=m3_locknut_height, r=1.6);
        }
        difference(){
    translate([28,9,0])
    cube([10,10,4]);
            translate([33,14,4])
    cylinder(h=m3_locknut_height, r=5.5/2+slop,center=true);
            translate([33,14,0])
            cylinder(h=m3_locknut_height, r=1.6);
        }
        difference() {
        cube([28,28,11]);
        translate([26,-0.1,5.5])
        rotate([270,0,0])
        cylinder(h=31,r=filament_guide/2,center=false);
        translate([2,2,3])
        cube([22,23,9.1]);
        translate([7,2.5,2])
        cube([10.75,20.5,7.1],center=false);
        translate([22,9.5,3])
        rotate([0,0,-5])
        cube([2,11.4,9],center=false);
        translate([22,20,3])
        cube([3,6.5,9],center=false);
        translate([24.5,22.25,3])
        cylinder(h=9,r=2.5,center=false);
        translate([-0.1,5,4.5])
        rotate([0,90,0])
        cylinder(h=2.11,r=1.5,center=false);
        translate([-0.1,22,4.5])
        rotate([0,90,0])
        cylinder(h=2.11,r=1.5,center=false);
        translate([-0.1,3.5,4.5])
        cube([3,3,7],center=false);
        translate([-0.1,20.5,4.5])
        cube([3,3,7],center=false);
    }
    
}
}

module case_group() {
    union() {
        translate([9.75,7,1.9])
        cube([2,2,4]);
    translate([9.75,15.5,1.9])
        cube([2,2,4]);
        difference(){
    translate([9,28,0])
    cube([10,10,4]);
            translate([14,33,4])
    cylinder(h=m3_locknut_height, r=5.5/2+slop,center=true);
            translate([14,33,-0.1])
            cylinder(h=m3_locknut_height, r=1.6);
        }
        difference(){
    translate([28,9,0])
    cube([10,10,4]);
            translate([33,14,4])
    cylinder(h=m3_locknut_height, r=5.5/2+slop,center=true);
            translate([33,14,-0.1])
            cylinder(h=m3_locknut_height, r=1.6);
        }
    difference() {
        cube([28,28,11]);
        translate([26,-0.1,4.5])
        rotate([270,0,0])
        cylinder(h=31,r=filament_guide/2,center=false);
        translate([2,2,3])
        cube([22,23,9.1]);
        translate([11.75,2,2])
        cube([11,23,7.1],center=false);
        translate([22,2,3])
        rotate([0,0,-5])
        cube([2,22.4,9],center=false);
        translate([22,20,3])
        cube([3,6.5,9],center=false);
        translate([25,22.75,3])
        cylinder(h=8,r=2,center=false);
        translate([-0.1,5,4.5])
        rotate([0,90,0])
        cylinder(h=2.11,r=1.5,center=false);
        translate([-0.1,22,4.5])
        rotate([0,90,0])
        cylinder(h=2.11,r=1.5,center=false);
        translate([-0.1,3.5,4.5])
        cube([3,3,7],center=false);
        translate([-0.1,20.5,4.5])
        cube([3,3,7],center=false);
    }
}
}

module flap() {
    union() {
        cube([0.5,22.4,9]);
        translate([0.25,21.2,0])
        cylinder(h=9,r=1.2,center=false);
    }
}
