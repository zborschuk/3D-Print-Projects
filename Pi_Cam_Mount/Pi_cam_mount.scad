$fn=36;

holder_switch();

angle = 130;
wall = 2;
slop = .2;
hole_height = 2.75;
hole_sep = 19.26;

height = 8;
length = hole_sep+wall*2;

endstop_width = 7.5;

m8_dia = 8;
m8_rad = m8_dia/2+slop;

m3_nut_rad = 6/cos(30)/2;
m3_nut_height = 3;
m3_rad = 1.8;
m3_cap_rad = 3.26;

module holder_switch(){
    width=26;
    thick = 24.5;
    cable_bump_width = 21;
    cable_bump_length = 6.5;
    cable_bump_height = 3;
    wire = 5;
    
    switch_height=7.2;
    
    difference(){
        union(){
            //rod clamp
            translate([0,0,height/2]) rotate([0,90,0]) round_clip(rad = m8_rad, height = height, wall = wall, angle=angle, support = 0, clamp=1, solid = 1);
            
            //endstop holder
            translate([-thick/2,0,switch_height/2+wall/2]) cube([thick+wall*2, width+wall*2,switch_height+wall], center=true);
        }
        
        //hollow out the rod
        translate([0,0,height/2]) rotate([0,90,0]) round_clip(rad = m8_rad, height = height, wall = wall, angle=angle, support = 0, clamp=1, solid = 0);
        
        difference(){
            union(){
                //endstop
                translate([-thick/2,0,switch_height/2+wall]) cube([thick, width,switch_height+wall], center=true);
                //wire pass
                translate([-thick+cable_bump_length/2-1.01,0,-.1]) cube([cable_bump_length+2, cable_bump_width,cable_bump_height], center=true);
            }
            
            //retainer bump
            translate([-thick-wall/5,0,switch_height*3/4]) scale([1,1,2]) sphere(r=wall/2);
        }
        
        //flatten bottom
        for(i=[-1,-1]) translate([10,0,24.85*i+height/2+height/2*i]) cube([100,100,50], center=true);
    }
}


module round_clip(rad=8, height=10, wall=3, angle=45, support=0, clamp=0, solid=0){
	translate([0,0,wall+rad])
	rotate([0,90,0])
	if(solid == 1){
		union(){
			translate([0,0,height/2]) rotate([0,0,30]) cylinder(r=(wall/2+rad)/cos(30), h=height*2, center=true);

			if(clamp==1){
				for(i=[-1,1]) rotate([0,0,i*angle/2]) translate([-rad-wall/2,0,0]) rotate([0,0,-i*angle/2]) rotate([i*90,0,0]) hull(){
					translate([wall*3, 0, 0]) cylinder(r1=wall+m3_nut_rad, r2=wall/2+m3_nut_rad, h=m3_nut_height+.1, $fn=6, center=true);
					translate([-m8_rad, 0, 0]) cylinder(r1=wall+m3_nut_rad, r2=wall/2+m3_nut_rad, h=m3_nut_height+.1, $fn=6, center=true);
				}
			}
		}
	}else{
		//hollow
		cylinder(r=rad, h=height*4, center=true);
		hull(){
			if(support==1){
				translate([0,0,rad+wall+height/2]) rotate([90,0,0]) cylinder(r=rad+wall, h=height*3, center=true);
			}else{
				translate([rad*2,0,rad+wall+height/2]) rotate([90,0,0]) cylinder(r=rad+wall, h=height*3, center=true);
			}
			translate([-rad,0,rad+wall+height/2]) rotate([90,0,0]) cylinder(r=rad+wall, h=height*3, center=true);
		}

		//zip tie slot
		*translate([-1,0,0]) difference(){
			cylinder(r=(wall/2+rad+2)/cos(30), h=3, center=true);
			cylinder(r=(wall/2+rad)/cos(30), h=4, center=true);
		}
		
		//clip cutout
		difference(){
			for(i=[-1,0,1]) rotate([0,0,i*(angle/2-30)]) translate([-rad*2,0,0]) cylinder(r=rad*2, h=height*3, center=true, $fn=3);
			for(i=[-1,1]) rotate([0,0,i*angle/2]) translate([-rad-wall/2,0,0]) cylinder(r=wall/2, h=height*3, center=true);
			if(clamp == 1){
				for(i=[-1,1]) rotate([0,0,i*angle/2]) translate([-rad-wall/2,0,0]) rotate([0,0,-i*angle/2]) rotate([i*90,0,0]) hull(){
					cylinder(r1=wall+m3_nut_rad, r2=wall/2+m3_nut_rad, h=m3_nut_height+.1, $fn=6, center=true);
					translate([-m8_rad, 0, 0]) cylinder(r1=wall+m3_nut_rad, r2=wall/2+m3_nut_rad, h=m3_nut_height+.1, $fn=6, center=true);
				}
			}
		}

		if(clamp == 1){
			rotate([0,0,1*angle/2]) translate([-rad-wall/2,0,0]) rotate([0,0,-1*angle/2]) rotate([i*90,0,0]) rotate([90,0,0]) translate([-m8_rad, 0, -m8_rad*4]) cylinder(r=m3_rad, h=m8_rad*6);
			rotate([0,0,1*angle/2]) translate([-rad-wall/2,0,0]) rotate([0,0,-1*angle/2]) rotate([i*90,0,0]) rotate([90,0,0]) translate([-m8_rad, 0, 0]) cylinder(r=m3_cap_rad, h=wall);
			rotate([0,0,-1*angle/2]) translate([-rad-wall/2,0,0]) rotate([0,0,1*angle/2]) rotate([i*90,0,0]) rotate([90,0,0]) translate([-m8_rad, 0, -wall]) cylinder(r=m3_nut_rad, h=wall, $fn=6);
		}
	}
}
