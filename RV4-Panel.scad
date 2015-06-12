//
//  F-PMRV Panel Upgrade Program 2015
//
//  Panel to be laser cut out of .063 inch (1.6 mm) 2024-T3 
//
//  Open SCAD Note: Set prefrences to turn off rendering at 6000 elements
//  (default seems to be 2000, which breaks the F5 preview)
//
//  V 0.1
//  02.06.2015 jblo Initial template
//          SkyView10inchDisplay();
//          SkyView7inchDisplay();
//          SkyViewGeneric1_8inchVertical();
//          SkyViewGeneric1_8inchHorizontal();
//  04.06.2015 jblo added:
//          StdInst3_125()
//          StdInst2_25()
//          TycoW23()
//          Klixon7274_2_X()
//  06.06.2015 jblo added:
//          Kannad406_RC102()
//          Cessna_S_1994_1_1()
//          IGN_A_510_2()
//          TycoW31()
//  07.06.2015 jblo added:
//          AN3027_7() toggle switch
//          RV4_F_403_Instrument_Panel()
//          Initial placement
//  09.06.2015 jblo added:
//          TY91() Radio
//          3.125 & 2.25 instument holes dia. corrected
//  11.06.2015 jblo
//          IGN_A_510() anti rotation key added
//          Falcon_ALT20INF_3() added
//          Accel_BJ10_2() added
//
//  Open: Backside attachment holes (shunt / GND / Power busses etc.)
//  Open: CTEK Charger connection (optional)
//  Open: Libelle
//  Open: Canopy Latch Hole(s)
//  Open: Clip for aerobatic prog. card
//  Open: Terrain warning OFF switch (for aerobatic)
//  Open: TY91 outer dimensions
//  Open: Master warning panel? LH of radio? (OilP / Gen / FuelP / CYL-COOL / AP ON/DIS)
//  Open: Master switch relocation?
//
//  What we do NOT put in the panel, but at some different place:
//  (Just to act as a reminder for completeness of avionics here)
//  Center stack: Clock
//  Center stack: GNS430 (possibly)
//  RH console: Intercom
//

// Some helper variables
$fn=180;
inch=25.4;
mm=1;

// uncomment (set to true) to see if the models have sufficient clearance.
show_outer_dimensions=false;
//show_outer_dimensions=true;


difference(){
    union() { // Add (the panel itself)
        RV4_F_403_Instrument_Panel();
    }
    union() { // Subtract (cut outs & holes)
        // PFD
        translate([0, 4.25*inch, 0])
            SkyView10inchDisplay();
        
        // Airspeed Ind. LH top
        translate([-10.32*inch/2 - 1.80*inch, (4.5 +7.06/4)* inch, 0])
            StdInst3_125();
        // Altimeter RH top (Falcon ALT20MBF-3 has identical cutout)
        translate([10.32*inch/2 + 1.80*inch, (4.5 +7.06/4)* inch, 0])
            Falcon_ALT20INF_3();
        
        if(0) {     // DYNON COM
            // COM panel CENTER top
            translate([0, (4.25+7.06/2)*inch + (+1.80*inch/2), 0])
                SkyViewGeneric1_8inchHorizontal();
            // AUX PTT (placeholder part)
            translate([(3.532+0.75)/2 * inch, (4.25+7.06/2)*inch + (+1.80*inch/2), 0])
                PTT_SW_12_MM();
        } else {    // TRIG TY91 COM
            // COM panel CENTER top (sits slightly higher than the Dynon COM)
            translate([0, (4.25+7.06/2+0.125)*inch + (+1.80*inch/2), 0])
                TY91();
            // AUX PTT (placeholder part)
            translate([(3.532+0.75)/2 * inch, (4.25+7.06/2+0.125)*inch + (+1.80*inch/2), 0])
                PTT_SW_12_MM();
        }
        
        // KNOB panel RH bot
        translate([(10.32 + 1.80) * inch / 2, 4.25*inch + (-3.532*inch/2), 0])
            SkyViewGeneric1_8inchVertical();

        // G-Meter RH top
        translate([9.75 * inch, 4.5 * inch, 0])
            Accel_BJ10_2();

        // AP panel LH bot
        translate([-(10.32 + 1.80) * inch / 2, 4.25*inch + (-3.532*inch/2), 0])
            SkyViewGeneric1_8inchVertical();
            
        // IGN switch RH bot
        translate([11.125*inch, 1.25*inch, 0])
            IGN_A_510_2();
            
        // Master Switch RH bot
        translate([9.25*inch, 1*inch, 0])
            Cessna_S_1994_1_1();

        // Avionic master switch 15A
        translate([(+10-0.75-0.75-0.75)*inch, 1*inch, 0])
            TycoW31();

        // AP DIS-ENGAGE switch
        translate([(-10+0.75+0.75+0.75)*inch, 1*inch, 0])
            PTT_SW_12_MM();

        // Fuel pump switch 10A
        translate([(-10+0.75+0.75)*inch, 1*inch, 0])
            TycoW31();

        // Flap switch
        translate([(-10-0.75)*inch, 1*inch, 0])
            AN3027_7();
            
        // ELT panel
        translate([14*mm - 53*mm + (10.32*inch/2), (4.25+7.06/2+0.125)*inch + (+1.80*inch/2), 0])
            Kannad406_RC102();

        // LH Fuse panel
        // Top Row
        // XPDR xA
        translate([(-10-0.75)*inch, 4*inch, 0])
            TycoW23();
        // RADIO xA
        translate([(-10)*inch, 4*inch, 0])
            TycoW23();
        // EFIS1 (front)
        translate([(-10+0.75)*inch, 4*inch, 0])
            TycoW23();
        // EFIS2 (back)
        translate([(-10+0.75+0.75)*inch, 4*inch, 0])
            TycoW23();
        // INTCOM & Headsets 2A
        translate([(-10+0.75+0.75+0.75)*inch, 4*inch, 0])
            TycoW23();
        // Bottom Row
        // Reserve xA
        translate([(-10-0.75-0.75)*inch, 2.5*inch, 0])
            TycoW23();
        // OV 2A
        translate([(-10-0.75)*inch, 2.5*inch, 0])
            TycoW23();
        // FLAPS 10A
        translate([-10*inch, 2.5*inch, 0])
            TycoW23();
        // GEN 10A
        translate([(-10+0.75)*inch, 2.5*inch, 0])
            TycoW23();
        // BAT 35A
        translate([(-10+0.75+0.75)*inch, 2.5*inch, 0])
            TycoW23();
        // AP xA
        translate([(-10+0.75+0.75+0.75)*inch, 2.5*inch, 0])
            TycoW23();

        // RH Fuse Panel
        // Top Row
        // Starter Engaged Warning Light (white/red)
        translate([(10-0.75-0.75-0.75)*inch, 4*inch, 0])
            TycoW23(); // Placeholder, correct part still needs to be selected
        // Bottom Row
        // Reserve xA (Strobes)
        translate([(10-0.75-0.75-0.75)*inch, 2.5*inch, 0])
            TycoW23();
        // Reserve xA
        translate([(10-0.75-0.75)*inch, 2.5*inch, 0])
            TycoW23();
        // UV Warning Light (yel blink)
        translate([(10-0.75)*inch, 2.5*inch, 0])
            TycoW23();
        // IGNITION 5A
        translate([(10)*inch, 2.5*inch, 0])
            TycoW23();

    }
}


module SkyView10inchDisplay() {
    // main cutout
    width=9.638 * inch;
    height=6.859 * inch;
    square([width, height], center=true);
    // LH mounting holes
    translate([-0.183 * inch - width / 2, 3 * inch, 0])
        circle(0.144 * inch / 2);
    translate([-0.183 * inch - width / 2, 0, 0])
        circle(0.144 * inch / 2);
    translate([-0.183 * inch - width / 2, -3 * inch, 0])
        circle(0.144 * inch / 2);
    // LH rivet nut holes
    translate([-0.183 * inch - width / 2, 3 * inch + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([-0.183 * inch - width / 2, 3 * inch + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    translate([-0.183 * inch - width / 2, 0 * inch + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([-0.183 * inch - width / 2, 0 * inch + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    translate([-0.183 * inch - width / 2, -3 * inch + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([-0.183 * inch - width / 2, -3 * inch + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    // RH mounting holes
    translate([0.183 * inch + width / 2, 3 * inch, 0])
        circle(0.144 * inch / 2);
    translate([0.183 * inch + width / 2, 0, 0])
        circle(0.144 * inch / 2);
    translate([0.183 * inch + width / 2, -3 * inch, 0])
        circle(0.144 * inch / 2);
     // RH rivet nut holes
    translate([0.183 * inch + width / 2, 3 * inch + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([0.183 * inch + width / 2, 3 * inch + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    translate([0.183 * inch + width / 2, 0 * inch + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([0.183 * inch + width / 2, 0 * inch + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    translate([0.183 * inch + width / 2, -3 * inch + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([0.183 * inch + width / 2, -3 * inch + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    if(show_outer_dimensions) {
        // outer dimensions
        o_width=10.32 * inch;
        o_height=7.06 * inch;
        square([o_width, o_height], center=true);
    }
}

module SkyView7inchDisplay() {
    // main cutout
    width=6.930 * inch;
    height=5.312 * inch;
    square([width, height], center=true);
    // LH mounting holes
    translate([-0.199 * inch - width / 2, 2 * inch, 0])
        circle(0.150 * inch / 2);
    translate([-0.199 * inch - width / 2, -2 * inch, 0])
        circle(0.150 * inch / 2);
    // LH rivneut holes
    translate([-0.199 * inch - width / 2, 2 * inch + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([-0.199 * inch - width / 2, 2 * inch + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    translate([-0.199 * inch - width / 2, -2 * inch + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([-0.199 * inch - width / 2, -2 * inch + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    // RH mounting holes
    translate([0.199 * inch + width / 2, 2 * inch, 0])
        circle(0.150 * inch / 2);
    translate([0.199 * inch + width / 2, -2 * inch, 0])
        circle(0.150 * inch / 2);
    // RH rivneut holes
    translate([0.199 * inch + width / 2, 2 * inch + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([0.199 * inch + width / 2, 2 * inch + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    translate([0.199 * inch + width / 2, -2 * inch + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([0.199 * inch + width / 2, -2 * inch + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    if(show_outer_dimensions) {
        // outer dimensions
        o_width=7.636 * inch;
        o_height=5.512 * inch;
        square([o_width, o_height], center=true);
    }
}

module SkyViewGeneric1_8inchVertical() {
    // used for VERTICAL AP / COM / KOB panels
    // used (optionally) also for IC panel
    //
    // main cutout
    width=1.24 * inch;
    height=3.36 * inch;
    square([width, height], center=true);
    // wider part of main cutout
    w_width=1.62 * inch;
    w_height=2.15 * inch;
    square([w_width, w_height], center=true);
    // LH mounting holes
    translate([-0.75 * inch, -2.472 * inch / 2, 0])
        circle(0.150 * inch / 2);
    translate([-0.75 * inch, 2.472 * inch / 2, 0])
        circle(0.150 * inch / 2);
    // LH rivet nut holes
    translate([-0.75 * inch, -2.472 * inch / 2 - 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([-0.75 * inch, -2.472 * inch / 2 - (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    translate([-0.75 * inch, 2.472 * inch / 2 + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([-0.75 * inch, 2.472 * inch / 2 + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    // RH mounting holes
    translate([0.75 * inch, -2.472 * inch / 2, 0])
        circle(0.150 * inch / 2);
    translate([0.75 * inch, 2.472 * inch / 2, 0])
        circle(0.150 * inch / 2);
    // RH rivet nut holes
    translate([0.75 * inch, -2.472 * inch / 2 - 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([0.75 * inch, -2.472 * inch / 2 - (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    translate([0.75 * inch, 2.472 * inch / 2 + 0.218 * inch, 0])
        circle(0.096 * inch / 2);
    translate([0.75 * inch, 2.472 * inch / 2 + (0.218 + 0.219) * inch, 0])
        circle(0.096 * inch / 2);
    if(show_outer_dimensions) {
        // outer dimensions
        o_width=1.80 * inch;
        o_height=3.532 * inch;
        square([o_width, o_height], center=true);
    }
}

module SkyViewGeneric1_8inchHorizontal() {
    // used for HORIZONTAL AP / COM / KOB panels
    // used (optionally) also for IC panel
    rotate([0, 0, 90])
        SkyViewGeneric1_8inchVertical();
}

module StdInst3_125() {
    // Std. 3.125 Instrument
    circle(3.16*inch/2);
    for( i=[45:90:315]) {
        rotate([0,0,i])
            translate([3.5*inch/2, 0, 0])
                circle(0.17*inch/2);
    }
}

module StdInst2_25() {
    // Std. 2.25 Instrument
    circle(2.3125*inch/2);
    for( i=[45:90:315]) {
        rotate([0,0,i])
            translate([2.625*inch/2, 0, 0])
                circle(0.17*inch/2);
    }
}

module TY91() {
    // Std. 2.25 (58mm hole) Instrument hole with flat top and bottom
    difference() {
        circle(58*mm/2);
        union() {
            // Top & bottom flats
            translate([0, 10 + 42.50/2, 0])
                square([58, 20], center=true);
            translate([0, -10 - 42.50/2, 0])
                square([58, 20], center=true);
        }
    }
    // Mounting holes
    translate([-56*mm/2, -18.75*mm, 0])
                circle(3.0*mm/2);
    translate([-56*mm/2, 18.75*mm, 0])
                circle(3.0*mm/2);
    translate([56*mm/2, 18.75*mm, 0])
                circle(3.0*mm/2);
    translate([56*mm/2, -18.75*mm, 0])
                circle(3.0*mm/2);  
}

module TycoW23() {
    // TYCO CIRCUIT BREAKER STD TYPE W23 SERIES Std. Pos
    circle(0.380 * inch/2);
    if(show_outer_dimensions) {
        // outer dimensions
        o_width=0.690 * inch;
        o_height=1.384 * inch;
        square([o_width, o_height], center=true);
    }
}

module TycoW31() {
    // TYCO CIRCUIT BREAKER SWITCH TYPE W31 SERIES Std. Pos
    difference() {
        circle(0.470 * inch/2);
        union() {
            // Anti rotation flats
            w=0.470 * inch;
            // LH
            translate([-w/2, 0, 0])
                square([(0.470-0.385) * inch, 0.470 * inch], center=true);
            // RH
            translate([w/2, 0, 0])
                square([(0.470-0.385) * inch, 0.470 * inch], center=true);
        }
    }
    if(show_outer_dimensions) {
        // outer dimensions
        o_width=0.690 * inch;
        o_height=1.384 * inch;
        square([o_width, o_height], center=true);
    }
}

module Klixon7274_2_X() {
    // KLIXON 7274-2-X Std. Pos
    // The commercial grade version of this circuit breaker is the Klixon 7277 series. The 7277 and 7274-2 series circuit breakers are physically and electrically identical, with the exception that the 7277 has wider calibration limits. 
    circle(0.500 * inch/2);
    translate([0, 0.375 * inch, 0])
        circle(0.125 * inch/2);
    if(show_outer_dimensions) {
        // outer dimensions
        o_width=0.562 * inch;
        o_height=0.75 * inch;
        square([o_width, o_height], center=true);
    }
}

module Kannad406_RC102() {
    // RC102 ELT Panel Std. Pos.
    circle(8 * mm/2); // LED as panel reference point
    translate([23 * mm, 0, 0])
        circle(6.5 * mm/2); // Switch
    // Mounting holes
    translate([(-14 + 3.35) * mm, 6.3 * mm, 0])
        circle(3.2 * mm/2);
    translate([(-14 + 3.35) * mm, -6.3 * mm, 0])
        circle(3.2 * mm/2);
    translate([(-14 + 53 -3.35) * mm, 6.3 * mm, 0])
        circle(3.2 * mm/2);
    translate([(-14 + 53 -3.35) * mm, -6.3 * mm, 0])
        circle(3.2 * mm/2);
    if(show_outer_dimensions) {
        // outer dimensions
        o_width=53 * mm;
        o_height=19.4 * mm;
        translate([(-14 + 53/2) * mm, 0, 0])
        square([o_width, o_height], center=true);
    }
}

module Cessna_S_1994_1_1() {
    // Cessna Split Master Switch S-1994-1-1 
    // (PN 11-15900 RED)
    // (PN 11-05733 BEIGE)
    // (PN 11-15910 HOUSING MNT)
    // Cutout for housing mount
    // Laser dimensions taken from SteinAir posting on Vansairforce site
    // Link: http://www.vansairforce.com/community/showthread.php?t=8113
    square([0.78 * inch, 1.4 * inch], center=true);
    if(show_outer_dimensions) {
        // outer dimensions (need to be verified)
        o_width=23*mm;
        o_height=40*mm;
        square([o_width, o_height], center=true);
    }
}

module IGN_A_510_2() {
    // A-510-2 Keyed ignition switch
    // Switch P/N 11-03170
    // Plate without start P/N 11-03668
    // Plate With start P/N 11-03667 
    // Dimensions from Aircraft Spruce Site:
    // Quote: "The hole size that it will take up is a 7/8" hole.
    // Now, the Switch Housing (the body behind the panel)
    // would be 1 3/4" in diameter."
    rad=7/8*inch/2;
    difference() {
        circle(rad);
        rotate([0, 0, 120])
            translate([0, rad ,0])
                square([1/8*inch, 1/8*inch], center=true);
    }
    if(show_outer_dimensions) {
        // outer dimensions
        circle(1.75 * inch/2);
    }
}

module AN3027_7() {
    // Toggle Switch (Flap)
    // MFG EATON
    // P/N  AN3027-7 	MS35059-27
    difference() {
        circle(15/32 * inch/2);
        union() {
            // Keyway at bottom 0.03 inch deep / 0.06 inch wide
            translate([0, -15/32 * inch/2, 0])
                square([0.06 * inch, 0.06 * inch], center=true);
        }
    }
    if(show_outer_dimensions) {
        // outer dimensions
        o_width=0.75 * inch;
        o_height=1.310 * inch;
        square([o_width, o_height], center=true);
    }
    
}

module Falcon_ALT20INF_3() {
    i_rad=80*mm/2;
    circle(i_rad); // main hole
    difference() {
        rotate([0, 0, -45]) // 45 deg LH bottom square
            translate([0, -i_rad+4.5, 0])
                hull() {
                    translate([27/2-8, 27/2-8, 0])
                        circle(8*mm);
                    translate([27/2-8, -27/2+8, 0])
                        circle(8*mm);
                    translate([-27/2+8, 27/2-8, 0])
                        circle(8*mm);
                    translate([-27/2+8, -27/2+8, 0])
                        circle(8*mm);
                }
        difference() { // square cutoff stencil
            rotate([0, 0, -45])
                translate([0, -i_rad, 0])
                    square([28*mm, 28*mm], center=true);
            circle(49*mm); // outer limiting circle
        }
    }
    // Mounting holes
    for( i=[45:90:315]) {
        rotate([0,0,i])
            translate([3.5*inch/2, 0, 0])
                circle(0.17*inch/2);
    }
}

module Accel_BJ10_2() {
    // Std. 2.25 Instrument with extra cut (LH bottom) for reset button axis
    circle(2.3125*inch/2);
    for( i=[45:90:315]) {
        rotate([0,0,i])
            translate([2.625*inch/2, 0, 0])
                circle(0.17*inch/2);
    }
    rotate([0,0,225])
        translate([2.3125*inch/2, 0, 0])
            square([5*mm, 2.6*mm], center=true);
}

module PTT_SW_12_MM() {
    // Keyed PTT switch
    // Switch P/N unmarked (China) key on left
    rad=12*mm/2;
    difference() {
        circle(rad);
        rotate([0, 0, 90])
            translate([0, rad ,0])
                square([2*mm, 2*mm], center=true);
    }
    if(show_outer_dimensions) {
        // outer dimensions
        square([17*mm, 20*mm], center=true);
    }
}

module RV4_F_403_Instrument_Panel() {
    // There seem to be several version of this panel.
    // This version taken from RV-4 S/N 3466 plans
    // RH polygon
    polygon([ [0,0], [12.2*inch,0], [12.2*inch,1.77*inch], [12.98*inch,1.77*inch], [12.94*inch,2*inch], [12.68*inch,3*inch], [12.25*inch,4*inch], [11.66*inch,5*inch], [10.83*inch,6*inch], [9.78*inch,7*inch], [8.35*inch,8*inch], [7.4*inch,8.5*inch], [6.33*inch,9*inch], [4.96*inch,9.5*inch], [2.95*inch,10*inch], [0,10.23*inch] ], convexity = 10);
    // LH polygon
    mirror([1,0,0])
            polygon([ [0,0], [12.2*inch,0], [12.2*inch,1.77*inch], [12.98*inch,1.77*inch], [12.94*inch,2*inch], [12.68*inch,3*inch], [12.25*inch,4*inch], [11.66*inch,5*inch], [10.83*inch,6*inch], [9.78*inch,7*inch], [8.35*inch,8*inch], [7.4*inch,8.5*inch], [6.33*inch,9*inch], [4.96*inch,9.5*inch], [2.95*inch,10*inch], [0,10.23*inch] ], convexity = 10);

}