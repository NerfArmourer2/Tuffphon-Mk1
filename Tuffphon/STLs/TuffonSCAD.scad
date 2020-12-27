///////////////////////////////////////////////////////////////////////////////
/*
    Parameters
*/
///////////////////////////////////////////////////////////////////////////////

THREAD_DIAMETER = 3; //Thread diameter in mm
THREAD_SAFETY_MARGIN = 0.2;
THREAD_SIZE = THREAD_DIAMETER + THREAD_SAFETY_MARGIN;


CAP_SAFETY_MARGIN = 0.5;
HEX_NUT_CAP_SIZE = THREAD_DIAMETER * 2 + CAP_SAFETY_MARGIN; //Cap size of hex nuts plus a user defined safety margin

$fn = 64; //Uncomment for pretty circles, slows rendering times



module hexnut(thickness, diameter)
{
    linear_extrude(height = thickness)
    {
        circle(d = diameter, $fn=6);
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


module 43_5_FWC_Cover()
{  
    translate([203.75, 48, -39])
    {
        rotate([90, 0, 0])
        {
            import("Gryphon Source/Gryphon Carbine/43.5mm/43.5mm Carbine FW Cover.stl");
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
        translate([-1, 17, -39])
        {
            rotate([90, 0, 0])
            {
                import("Gryphon Source/Pusher Mechanism/Top Mech Cover.stl");
            }
        }
        
    }
}

module WireRunFL()
{
    union()
    {
        translate([90.5, 3, 22])
        {
            import("Gryphon Source/Magwell/Full-Length/Wire Run (FL).stl");
        }
        
        translate([10, 25, -0.52])
        {
            cube([75, 12, 2]);
        }
    }
          
        
}


module GripFrame()
{
    translate([-1, 99, 3])
    {
        import("Gryphon Source/Grip/Grip Frame.stl");
    }
}


module StockPointA()
{
    translate([-116.25, -29.5, 18])
    {
        import("Gryphon Source/Battery Stock/Stock Caps + Sling Mounts/Stock Cap (A).stl");
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
            hexnut(10, HEX_NUT_CAP_SIZE);
        }
        
        translate([91.5, 43.5, 1])
        {
            cylinder(d = 3.2, h = 100);
            hexnut(10, HEX_NUT_CAP_SIZE);
        }
        
        translate([13.25, 43.5, -50])
        {
            cylinder(d = THREAD_SIZE, h = 100);
        }
        
        translate([91.5, 43.5, -50])
        {
            cylinder(d = THREAD_SIZE, h = 100);
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


module Hardened_Carbine_43_5_FWC_Cover()
{
    difference()
    {
        43_5_FWC_Cover();
        
        translate([128, 23.5, 4.5])
        {
            cube([2, 6, 6]);
        }
        
        translate([128, 57.5, 4.5])
        {
            cube([2, 6, 6]);
        }
    }
}

module Hardened_Carbine_Motor_Cover()
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
            hexnut(10, HEX_NUT_CAP_SIZE);
        }
        
        translate([91.5, 43.5, 1])
        {
            cylinder(d = 3.2, h = 100);
            hexnut(10, HEX_NUT_CAP_SIZE);
        }
        
        translate([13.25, 43.5, -50])
        {
            cylinder(d = THREAD_SIZE, h = 100);
        }
        
        translate([91.5, 43.5, -50])
        {
            cylinder(d = THREAD_SIZE, h = 100);
        }
        
        translate([4, 43.5 - 6 / 2, -6])
        {
            cube([2.5, 6, 8]);
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
                cylinder(d = THREAD_SIZE, h = 100);
            }
        }
 
        translate([118.85, 118, -4.25])
        {
            rotate([90, 0, 0])
            {
                cylinder(d = THREAD_SIZE, h = 100);
            }
        }
        
        //Square nut traps
        translate([115.5, 24.5, -9])
        {
            cube([6.5, 2.5, 8]);            
        }

        translate([22.25, 24.5, -9])
        {
            cube([6.5, 2.5, 8]);            
        }
 
        //Hex nuts
        translate([114, 5, -2.5])
        {   
            hexnut(20, HEX_NUT_CAP_SIZE);
        }
 
        translate([24.5, 5, -2.5])
        {   
            hexnut(20, HEX_NUT_CAP_SIZE);
        }

        translate([24.5, 13.5, -2.5])
        {   
            hexnut(20, HEX_NUT_CAP_SIZE);
        }

        translate([5, 16, -1])
        {   
            hexnut(20, HEX_NUT_CAP_SIZE);
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
                cylinder(d = THREAD_SIZE, h = 100);
            }
        }
 
        translate([118.85, 8, -4.25])
        {
            rotate([90, 0, 0])
            {
                cylinder(d = THREAD_SIZE, h = 100);
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


module Hardened_Top_Cover()
{
    difference()
    {
        union()
        {
            Top_Mech_Cover(); 
            
            //Filling in hard bits
            translate([2, 7.5, 0])
            {
                cube([46, 10, 10]);
            }
 
            translate([94, 7.5, 0])
            {
                cube([23, 10, 10]);
            }
             
        }
        
            //Square nut for stock mounting at rear
            translate([115, 9, 3])
            {
                cube([2.5, 6.5, 20]);
            }
            
            //Through bolt holes for top mech covers            
            translate([31, 12.5, 3])
            {
                cylinder(d = THREAD_SIZE, h = 100);
            }
            
            translate([108, 12.5, 3])
            {
                cylinder(d = THREAD_SIZE, h = 100);
            }
            
            //Trapped nuts for picatinny       
            translate([31.5, 12.5, 0])
            {
                cylinder(d = THREAD_SIZE, h = 100);
                hexnut(6, HEX_NUT_CAP_SIZE);
            }
            
            translate([108, 12.5, 0])
            {
                cylinder(d = THREAD_SIZE, h = 100);
                hexnut(6, HEX_NUT_CAP_SIZE);
            }

    }
    
}


module Hardened_Grip_Frame()
{
    difference()
    {
        GripFrame();
        
        //Mag well joint square nut trap
        translate([4, 111.5, 4.5])
        {
            cube([2.5, 6, 7.5]);
        }
        
        //Stock joint square nut trap
        translate([110, 102, (15 / 2) - 3])
        {
            cube([2.5, 75, 6]);
        }
        
        //Trigger cover nut trap
        translate([12, 104, 0])
        {
            cylinder(d = 3, h = 100);
            hexnut(2, HEX_NUT_CAP_SIZE);
            
        }
        
    }
}

module HardenedStockPointA()
{
    difference()
    {
        StockPointA();
        
        translate([0, 0, -0])
        {
            hexnut(6, HEX_NUT_CAP_SIZE + 0.5);
        }
    }
}

module BlankWireRunFL()
{
    union()
    {
        WireRunFL();
        
        translate([10, 25, -0.52])
        {
            cube([75, 12, 2]);
        }
    }
          
        
}

module TextWireRun()
{
    difference()
    {
        BlankWireRunFL();
        
        translate([60, 27, -1])
        {
            mirror([1, 0, 0])
            {
                linear_extrude(1)
                {
                    text("9:50");
                }
            }
        }
        
    }
    
    
}

Hardened_Carbine_Motor_Cover();
//Hardened_43_5_Carbine_FWC();
//Hardened_Right_Cover();
//Hardened_Left_Cover();
//Hardened_Top_Cover();
//TextWireRun();
//Hardened_Grip_Frame();
//HardenedStockPointA();
//Hardened_Carbine_43_5_FWC_Cover();