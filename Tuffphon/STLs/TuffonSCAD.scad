$fn = 64;

module hexnut(thickness, diameter)
{
    linear_extrude(height = thickness)
    {
        circle(r=diameter / 2, $fn=6);
    }
}

module 43_5_Carbine_FWC()
{
//Gryphon Carbine Flywheel Cage Bottom Cover
    difference()
    {
        translate([203.75, 48, -21])
        {
            rotate([90, 0, 0])
            {
                import("Gryphon Source/Gryphon Carbine/43.5mm/43.5mm Carbine FWC.stl");
            }
        }
        
    }
}

module Carbine_Motor_Cover()
{
    difference()
    {
        translate([203.75, 48, -20])
        {
            rotate([90, 0, 0])
            {
                import("Gryphon Source/Gryphon Carbine/Carbine_Motor_Cover.stl");
            }
        }
        
    }
}  

module Hardened_43_5_Carbine_FWC()
{
    difference()
    {
        union()
        {
            //Carbine_Motor_Cover();
            43_5_Carbine_FWC();
        }
        
        translate([13.25, 43.5, 1])
        {
            cylinder(d = 3.2, h = 100);
            hexnut(10, 6.75);
        }
        
        translate([91.5, 43.5, 1])
        {
            cylinder(d = 3.2, h = 100);
            hexnut(10, 6.75);
        }
        
        translate([13.25, 43.5, -50])
        {
            cylinder(d = 3.2, h = 100);
        }
        
        translate([91.5, 43.5, -50])
        {
            cylinder(d = 3.2, h = 100);
        }
        
        //Square nut mounts for mag well to flywheel cage
        
        translate([135, 20.75, -0.5])
        {
            cube([2.5, 6.5, 6.5]);
        }
        
        translate([135, 59.75, -0.5])
        {
            cube([2.5, 6.5, 6.5]);
        }
        
    }
}

module Hardened_Motor_Cover()
{
    difference()
    {
        union()
        {
            Carbine_Motor_Cover();
            //43_5_Carbine_FWC();
        }
        
        translate([13.25, 43.5, 1])
        {
            cylinder(d = 3.2, h = 100);
            hexnut(10, 6.75);
        }
        
        translate([91.5, 43.5, 1])
        {
            cylinder(d = 3.2, h = 100);
            hexnut(10, 6.75);
        }
        
        translate([13.25, 43.5, -50])
        {
            cylinder(d = 3.2, h = 100);
        }
        
        translate([91.5, 43.5, -50])
        {
            cylinder(d = 3.2, h = 100);
        }
        
        translate([2, 43.5 - 6.5 / 2, -6])
        {
            cube([2.5, 6.5, 8]);
        }
        
    }
}

Hardened_Motor_Cover();
//Hardened_43_5_Carbine_FWC();