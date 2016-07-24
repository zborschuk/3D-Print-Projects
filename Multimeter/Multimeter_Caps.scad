inner_rad = 3.5;
outer_rad = 4.3;
cap_rad = 6;
cap_height = 1;
height = 18;
$fn=180;
difference() {
    union() {
        cylinder(h=cap_height, r=cap_rad);
        cylinder(h=cap_height+height, r=outer_rad);
    }
    translate([0,0,cap_height])
    cylinder(h=height+.1, r=inner_rad);
}