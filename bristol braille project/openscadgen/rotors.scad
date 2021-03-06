include <globals.scad>;

module rotor()
{
  translate([-rotor_thickness/2,0,0])
    rotate([0,90,0])
      linear_extrude(height=rotor_thickness) import("depdxf/rotor.dxf");
}

module rotors()
{
  color("purple")
  {
  for(x=[0:num_solenoids-1])
  {
    translate([x*pitch,0,0])
      rotor();
  }
  }
}

module rotor_rod()
{
  smooth=20;
    rotate([0,90,0])
      cylinder(r=rotor_spindle_radius,h=base_width+edge_margin,$fn=smooth);
}
