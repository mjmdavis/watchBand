include <bandEnd.scad>;

wireGauge = 1.5;
wireDetail = 48;

loopDiameter = 22;

rotation = 17;

module semiRing() {
difference(){
rotate_extrude(convexity = 10, $fn=wireDetail)
translate([loopDiameter/2, 0, 0])
circle(r = wireGauge/2, $fn=wireDetail);
translate([-loopDiameter,0,-loopDiameter])
cube([loopDiameter*2,loopDiameter*2,loopDiameter*2]);
}
}

module ringPiece(){
rotate([0,rotation,0])
translate([-loopDiameter/2,0,0])
semiRing();
rotate([180,-rotation,0])
translate([loopDiameter/2,0,0])
semiRing();
}

sectionOffset = 2 * loopDiameter * cos(rotation);
module braidPiece(){
ringPiece();
translate([sectionOffset,0,0])
ringPiece();
}

nStrands = 6;
so = sectionOffset;
module braidSection() {
translate([-sectionOffset/2,0,wireGauge/2])
intersection() {
for (n = [0:nStrands]){
translate([n*(sectionOffset/nStrands),0,0])
braidPiece();
};
translate([so/2,-so/2,-so/2])
cube([so,so,so]);
}
}

module braidLength(nSections) {
translate([0,strapWidth/2,0])
pebbleSteelStrapMount();
for (n=[0:nSections-1]){
translate([sectionOffset * n,0,0])
braidSection();
}
translate([nSections*sectionOffset,-strapWidth/2,0])
rotate([0,0,180])
pebbleSteelStrapMount();
echo("length of braid = ", nSections * sectionOffset);
}

braidLength(3);

echo("sectionLength = ", sectionOffset);