$fn = 64;

module hexnut(thickness, diameter)
{
    linear_extrude(height = thickness)
    {
        circle(r=diameter / 2, $fn=6);
    }
}


///////////////////////////////////////////////////////////////////////////////
/*
    Zeroing Parts Modules
    Parts are imported and then adjusted to 0,0
*/
///////////////////////////////////////////////////////////////////////////////

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

module Left_Mech_Cover()
{
//Left Mech Cover
    difference()
    {
        translate([11.5, -10, -17])
        {
            rotate([0, 0, 0])
            {
                import("Gryphon Source/Pusher Mechanism/Left Mech Cover.stl");
            }
        }
        
    }
}

module Right_Mech_Cover()
{
//Right Mech Cover 
    difference()
    {
        translate([11.5, 39, -8])
        {
            rotate([180, 0, 0])
            {
                import("Gryphon Source/Pusher Mechanism/Right Mech Cover.stl");
            }
        }
        
    }
}

module Top_Mech_Cover()
{
//Top Mech Cover
    difference()
    {
        translate([203.75, 48, -21])
        {
            rotate([90, 0, 0])
            {
                import("Gryphon Source/Pusher_Mechanism/Top Mech Cover.stl");
            }
        }
        
    }
}


///////////////////////////////////////////////////////////////////////////////
/*
    Hardening Parts Modules
    Appropriate hex and square nut positions
*/
///////////////////////////////////////////////////////////////////////////////

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

module Hardened_Left_Cover()
{
    difference()
    {
        union()
        {
            Left_Mech_Cover();
            
            translate([14.5, 23.5, -7.5])
            {
                cube([115, 3.5, 7]);
            }
                    
        }
        
        translate([25.25, 118, -4.25])
        {
            rotate([90, 0, 0])
            {
                cylinder(d = 3.2, h = 100);
            }
        }
 
        translate([118.85, 118, -4.25])
        {
            rotate([90, 0, 0])
            {
                cylinder(d = 3.2, h = 100);
            }
        }
        
        //Square nut traps
        translate([115.5, 24.5, -9])
        {
            cube([6.5, 2.5, 8]);            
        }

        translate([22.25, 24.5, -9])
        {
            cube([6.5, 2.5,8]);            
        }       
        
    }
}

module Hardened_Right_Cover()
{
    difference()
    {
        union()
        {
            Right_Mech_Cover();
            
            translate([21.5, 2, -7.5])
            {
                cube([108, 3.5, 7]);
            }
                    
        }
        
        translate([25.25, 8, -4.25])
        {
            rotate([90, 0, 0])
            {
                cylinder(d = 3.2, h = 100);
            }
        }
 
        translate([118.85, 8, -4.25])
        {
            rotate([90, 0, 0])
            {
                cylinder(d = 3.2, h = 100);
            }
        }
        
        //Square nut traps
        translate([115.5, 2.5, -9])
        {
            cube([6.5, 2.5, 8]);            
        }

        translate([22.25, 2.5, -9])
        {
            cube([6.5, 2.5, 8]);            
        }       
        
    }
}

//Hardened_Motor_Cover();
//Hardened_43_5_Carbine_FWC();
//Hardened_Right_Cover();
Hardened_Left_Cover();