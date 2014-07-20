pinDia = 1.5;
pinRad = pinDia/2;

lugDia = 3;
lugRad = lugDia/2;

strapThickness = 8;
strapWidth = 24;

cylDet = 100;

module pebbleSteelStrapMount() {
	translate([-(9.2 + strapThickness/2),0,0])
	rotate([90,0,0])
	difference(){
		difference(){
			difference(){
				lugStrapHull();

				translate([-7.5,-5,9.5])
				cube([10,10,5]);
			}
			translate([-7.5,-5,0])
			cube([10,10,5]);
		}
		translate([-7.5,-5,19])
		cube([10,10,5]);
	}
}

module lugStrapHull(){
	union(){
		difference(){
			hull(){
				translate([0,lugRad,0])
				cylinder(strapWidth,lugRad,lugRad, $fn=cylDet);
				translate([9.2,strapThickness/2,0])
				cylinder(strapWidth,strapThickness/2,strapThickness/2, $fn=cylDet);
			}
			translate([0,lugRad,0])
			cylinder(strapWidth,pinRad,pinRad, $fn=cylDet);
		}
	translate([9.2,0,0])
 	cube([strapThickness/2,strapThickness,strapWidth]);
	}
}

//pebbleSteelStrapMount();