/* HARDWARIO IoT Kit Enclosure models for 3D print
https://www.hardwario.com/
https://shop.hardwario.com/modules-tags/
https://shop.hardwario.com/enclosures/ 

This project is licensed under the [Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/) - see the [LICENSE](LICENSE) file for details.
*/

use <MCAD/boxes.scad>;
use <MCAD/triangles.scad>;
 
//SELECT ENCLOSURE
//Option: "A" = part A; "B" = part B; "C" = cover; "ALL" whole box 
color ("Silver")
HWE101("ALL"); //Mini Battery + Core + Mini Cover
//HWE102("ALL"); //Mini Battery + Sigfox + Core + Mini Cover
//HWE103("ALL"); //Mini Battery + 1-Wire + Core + Mini Cover
//HWE104("ALL"); //Mini Battery + Sigfox + 1-Wire + Core + Mini Cover
//HWE105("ALL"); //Mini Battery + Sensor R1.1 + Core + Cover
//HWE106("ALL"); //Mini Battery + Sigfox + Sensor R1.1 + Core + Cover
//HWE108("ALL"); //Mini Battery + Relay + Core + Mini Cover
//HWE109("ALL"); //Mini Battery + Sigfox + Relay + Core + Mini Cover
//HWE401("ALL"); //1-Wire + Cover
//HWE402("ALL"); //Bridge + Tag
//HWE201("ALL"); //Battery R1.4 + CO2 + Core + Cover
//HWE202("ALL"); //Battery R1.4 + CO2 + Sigfox + Core + Cover
//HWE203("ALL"); //Battery + CO2 + Core + LCD (Tags ouside)
//HWE204("ALL"); //Battery R1.4 + CO2 + Core + LCD (Tags inside)
//HWE205("ALL"); //Battery + Core + Cover
//HWE206("ALL"); //Battery + CO2 + Sigfox + Core + LCD (Tags inside)
//HWE208("ALL"); //Battery + Core + Split + LCD & PIR (or LCD & Climate) & 2x Tag (intside)
//HWE209("ALL"); //Battery + Core + Compact Split + LCD & Climate
//HWE210("ALL"); //Battery + Split Core & Split + LCD & GPS (or PIR & Climate) & No Tag
//HWE211("ALL"); //Battery + Sigfox + Core + LCD (Tags inside)
//HWE301("ALL"); //Power + Core + Cover
//HWE302("ALL"); //Power + Core + Encoder 
//HWE303("ALL"); //Power + Core + Encoder + LCD //TO BE DONE
//HWE304("ALL"); //Power + Sigfox + Core + Cover
//HWE305("ALL"); //Power + Sigfox + CO2 + Core + Cover
//HWE501("ALL"); //Mini Battery + Sensor + Core + Flood Detector
//HWE502("ALL"); //Mini Battery + Sensor + Core + Sigfox + Flood Detector


//RENDER IMAGE FOR PNG EXPORT
//print("HWE101"); // Type enclosure model to render in red color

//CAMERA VIEW SETTING
//    //small enclosure
//    $vpr = [34,0,17];   // view angle
//    $vpt = [0,-5,35];   // view tranlsation
//    $vpd = 250;         // view distance
//    
//    // large enclosure / low
//    $vpr = [34,0,17];   // view angle
//    $vpt = [0,-5,32];   // view tranlsation
//    $vpd = 265;         // view distance
//    
//    // large enclosure / tall
//    $vpr = [34,0,17];   // view angle
//    $vpt = [0,-5,38];   // view tranlsation
//    $vpd = 275;         // view distance

//dimension check
//translate([0,-30,0]) cube([10,10,50]);


/* [Render otions] */
sidesonly=1; // [0:No, 1:Yes] round the sides of the box?
previw_mode = 0; //[0:No, 1:Yes] 1 for faster rendering
step = 8; // resolution of ring corner - STEP in degrees
$fn = 50; // default resolution = 50
  
wall=2.0;  // Wall Thickness
length= 55.7; // enclosure length
cut_length = 16; //Part A / B cut

// Mounting holes params
screw_hole_height = 2.1;
screw_size = 3.2;
screw_hole_angle = 15;
screw_hole_top_size = screw_size+4;
 
//Holder for PCB
holder_w = 0.8;
holder_h = 1;
holder_short = 7; // multiplier of top holder shortcut (=1 the same as bottom holder)
  
// Corner Radius
radius=3.8; // radius
radius_bot=3.8+2.5; //inner radius of bottom
 
//Rubber ring
ring_r = 1;
ring_top_pos = 2.6;
ring_bottom_pos = 2.6;
 
cut_type = 0; // [1: old, 0: new]
 
// Get outside mesurments
/* [Advanced] */
r_MiniUSB=1;
r_wifi_antenna = 4.8;
 
PCB_height=1.1;
fatPCB_height=1.6;
PCB_tolerance = 0.4; //grove tolerance for PCB
MiniPCB_width=33;
PCB_width=88;
PCB_radius=3.8;
 
USBmicro_height=5.7;
USBmicro_width=12;
USBmicro_length=wall/2;
USBmicro_hole=3.5;
USBmicro_hole_span=8.2;

flood_detector_width=10.8;
flood_detector_length=20.7;
flood_detector_contact_width=2;
flood_detector_contact_length=5.5;
 
terminal185mm_height=7.6;
terminal185mm_width=19;
terminal185mm_length=wall;
terminal185mm_upper_recess=1;
terminal185mm_bottom_recess=4;

terminal17mm_height=8.5;
terminal17mm_width=17;
terminal17mm_length=wall;
terminal17mm_upper_recess=2.5;
terminal17mm_bottom_recess=4.8;

terminal15mm_height=7.7;
terminal15mm_width=15.5;
terminal15mm_length=wall;
terminal15mm_upper_recess=1;
terminal15mm_bottom_recess=4.8;

terminal12_3mm_height=7.6;
terminal12_3mm_width=12.6;
terminal12_3mm_length=wall;
terminal12_3mm_upper_recess=1;
terminal12_3mm_bottom_recess=4.1;
 
key_width_wall=0.2;
key_length_wall=wall;
key_height_wall=1.6;
key_x_roof=8.2;
key_y_roof=wall;
key_height_roof=0.35;


module HWE101 (value) { //Mini Battery + Core + Mini Cover
    width= 33.1; 
    height= 32.1;
    holder_diff = PCB_height+PCB_tolerance;
    holder_pos = 13;  

        numberPrint("101",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 19])
                MiniCore21();
            translate([0, 9, 0])
                mountingHoles1xx();
        }
}
module HWE102 (value) { //Mini Battery + Sigfox + Core + Mini Cover
    width= 33.1;
    height= 44.2;
    holder_diff = PCB_height+PCB_tolerance;
    holder_pos = 13;

        numberPrint("102",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 31.6-0.4])
                MiniCore21();
            translate([0,0, 19])
                MiniSigfox1();
            translate([0, 9, 0])
                mountingHoles1xx();
        }
}
module HWE103 (value) { //Mini Battery + 1-Wire + Core + Mini Cove
    width= 33.1;
    height= 44.4;
    holder_diff = PCB_height+PCB_tolerance;
    holder_pos = 13;

        numberPrint("103",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 31.6])
                MiniCore21();
            translate([0,0, 19])
                MiniSensorModuleR10();
            translate([0, 9, 0])
                mountingHoles1xx();
        }
}
module HWE104 (value) { //Mini Battery + Sigfox + 1-Wire + Core + Mini Cover
    width= 33.1;
    height= 57.1;
    holder_diff = PCB_height+PCB_tolerance;
    holder_pos = 13;

        numberPrint("104",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
                            
            translate([0,0, 44.1])
                MiniCore21();
            translate([0,0, 31.8])
                MiniSensorModuleR10();
            translate([0,0, 18.9])
                MiniSigfox1();
            translate([0, 9, 0])
                mountingHoles1xx();
        }
}
module HWE105 (value) { //Mini Battery + Sensor R1.1 + Core + Cover
    width= 33.1;
    height= 44.2;
    holder_diff = PCB_height+PCB_tolerance;
    holder_pos = 13;

        numberPrint("105",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
       
            translate([0,0, 31.2])
                MiniCore21();
            translate([0,0, 18.4])
                MiniSensorModuleR11();
            translate([0, 9, 0])
                mountingHoles1xx();
        }
}
module HWE106 (value) { //Mini Battery + Sigfox + Sensor R1.1 + Core + Cover
    width= 33.1;
    height= 56.9;
    holder_diff = PCB_height+PCB_tolerance;
    holder_pos = 13;

        numberPrint("106",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
                            
            translate([0,0, 44.2])
                MiniCore21();
            translate([0,0, 31])
                MiniSensorModuleR11();
            translate([0,0, 19])
                MiniSigfox1();
            translate([0, 9, 0])
                mountingHoles1xx();
        }
}

module HWE108 (value) { //Mini Battery + Relay + Core + Mini Cover
    width= 33.1;
    height= 44;
    holder_diff = PCB_height+PCB_tolerance;
    holder_pos = 13;

        numberPrint("108",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }            
            translate([0,0, 31.27])
                MiniCore21();
            translate([0,0, 19.05])
                MiniRelay();
            translate([0, 9, 0])
                mountingHoles1xx();
        }
}

module HWE109 (value) { //Mini Battery + Sigfox + Relay + Core + Mini Cover
    width= 33.1;
    height= 56;
    holder_diff = PCB_height+PCB_tolerance;
    holder_pos = 13;

        numberPrint("109",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 43.0])
                MiniCore21();
            translate([0,0, 31])
                MiniRelay();
            translate([0,0, 19])
                MiniSigfox1();
            translate([0, 9, 0])
                mountingHoles1xx();
        }
}

module HWE401 (value) { //1-Wire + Cover
    width= 33.1;
    height= 27.9;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 13;

        numberPrint("401",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 12.5+holder_h+fatPCB_height]) color ([0, 0, 1])
                MiniSensorModuleR10();
            translate([0, 9, 0])
                mountingHoles1xx();
        }
}

module HWE402 (value) { //Bridge + Tag
    width= 33.1;
    height= 21.6;
    holder_diff = PCB_height+PCB_tolerance;
    holder_pos = 10.775;

        numberPrint("402",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 10.3+holder_h+PCB_height]) color ([0, 0, 1])
                MiniBridge();
                
            translate([0, 9, 0])
                mountingHoles1xx();
        }
}

module HWE201 (value) { //Battery + CO2 + Core + Cover
    width= 88.15;
    height= 50.9-0.2;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 11.6;

    numberPrint("201",value);
    difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 37.8+0.3])
                MiniCore21();
            translate([23, -8, 0]) mountingHoles3xx();
        } 
}


module HWE202 (value) { //Battery R1.4+ CO2 + Sigfox + Core + Cover
    width= 88.15;
    height= 63.3-0.2;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 11.6;

    numberPrint("202",value);
    difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 50.3-0.1])
                MiniCore21();
            translate([0,0, 37.8-0.1])
                MiniSigfox1();
            translate([23, -8, 0]) mountingHoles3xx();
        } 
}

module HWE203 (value) { //Battery + CO2 + Core + LCD (Tags outside)
    width= 88.15;
    height= 34.4;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 11.6;
    cover_height=16.4;

    numberPrint("203",value);    
    if (value=="A" || value=="B" || value=="ALL") {
        difference() {
                translate([0,0,height/2+wall/2]) {
                    hollowbox(width, height, holder_diff, value);
                    holder(width, height, holder_diff, holder_pos, value);
                    if (value=="B" || value=="ALL") translate([-22/2 , -length/2-wall, height-cover_height]) cube ([22, wall, cover_height-5.1]);
                    if (value=="A" || value=="ALL")translate([-22/2 , length/2, height-cover_height]) cube ([22, wall, cover_height-5.1]); 
                    }
                translate([0 ,0, 37.8])
                    MiniCore21();
                translate([23, -8, 0]) mountingHoles3xx();
            }
        }
    if (value=="C" || value=="ALL") {

        translate ([0, 0, height+fatPCB_height+1.2]) { //comment
         part_C ("3tags_vent");
        } //comment
    }
}

module HWE204 (value) { //Battery + CO2 + Core + LCD (Tags inside)
    width= 88.15;
    height= 50.7-2.7;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 11.6;

    numberPrint("204",value);
    if (value=="A" || value=="B" || value=="ALL") {
        difference() {
                translate([0,0,height/2+wall/2]) {
                    hollowbox(width, height, holder_diff, value);
                    holder(width, height, holder_diff, holder_pos, value);
                    }
                translate([0 ,0, 37.8+0.3])
                    MiniCore21();
                translate([23, -8, 0]) mountingHoles3xx();
            }
        }
    if (value=="C" || value=="ALL") {
        translate ([0, 0, height+fatPCB_height+1.2]) { //comment
            part_C ("2vents");
        } //comment
    }
}

module HWE205 (value) { //Battery + Core  + Cover //
    width= 88.15;
    height= 39;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 11.6;

    numberPrint("205",value);
    difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 26.2])
                MiniCore21();
            translate([23, -8, 0]) mountingHoles3xx();
        } 
}

module HWE206 (value) { //Battery + CO2 + Sigfox + Core + LCD (Tags inside)
    width= 88.15;
    height= 58.9;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 11.6;

    numberPrint("206",value);
     if (value=="A" || value=="B" || value=="ALL") {
        difference() {
                translate([0,0,height/2+wall/2]) {
                    hollowbox(width, height, holder_diff, value);
                    holder(width, height, holder_diff, holder_pos, value);
                    }
                translate([0,0, 50.3])
                    MiniCore21();
                translate([0,0, 37.8])
                    MiniSigfox1();
                translate([23, -8, 0]) mountingHoles3xx();
            } 
        }
      if (value=="C" || value=="ALL") {
            translate ([0, 0, height+fatPCB_height+1.2]) { //comment
                part_C ("2vents");
            } //comment
        }
}

module HWE208 (value) { //Battery + Core + Split + LCD & PIR (or LCD & Climate) & 2x Tag (outside)
    width= 88.15;
    height= 46.8;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 11.6;
    vents_length = 21;
    cover_height=4;

    numberPrint("208",value);
    if (value=="A" || value=="B" || value=="ALL") {
        difference() {
                translate([0,0,height/2+wall/2]) {
                    hollowbox(width, height, holder_diff, value);
                    holder(width, height, holder_diff, holder_pos, value);
                    }
                translate([0,0, 26.2])
                    MiniCore21();
                translate([23, -8, 0]) mountingHoles3xx();
            }
        }
    if (value=="C" || value=="ALL") {
        translate ([0, 0, height+fatPCB_height+1.2]) { //comment
            part_C ("2miniPCB_2tags");
        } //comment
    }
}

module HWE209 (value) { //Battery + Core + Compact Split + LCD & Climate
    width= 88.15;
    height= 39.4;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 11.6;
    vents_length = 21;
    cover_height=4;

    numberPrint("209",value);
    if (value=="A" || value=="B" || value=="ALL") {
        difference() {
                translate([0,0,height/2+wall/2]) {
                    hollowbox(width, height, holder_diff, value);
                    holder(width, height, holder_diff, holder_pos, value);
                    }
                translate([0,0, 26.2])
                    MiniCore21();
                translate([23, -8, 0]) mountingHoles3xx();
            }
        }
    if (value=="C" || value=="ALL") {
        translate ([0, 0, height+fatPCB_height+1.2]) { //comment
            part_C ("2miniPCB");
        } //comment
    }
        
}

module HWE210 (value) { //Battery + Split Core & Split + LCD & GPS (or PIR & Climate) & No Tag
    width= 88.15;
    height= 46.8;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 11.6;
    vents_length = 10;
    cover_height=4;

    numberPrint("210",value);
    if (value=="A" || value=="B" || value=="ALL") {
        difference() {
                translate([0,0,height/2+wall/2]) {
                    hollowbox(width, height, holder_diff, value);
                    holder(width, height, holder_diff, holder_pos, value);
                    }
                translate([-(88.15/2)+(MiniPCB_width/2) ,0, 37.7])
                    MiniCore21();
                translate([(88.15/2)-(MiniPCB_width/2) ,0, 37.4])
                    MiniSigfox1();
                translate([23, -8, 0]) mountingHoles3xx();
            }
        }
    if (value=="C" || value=="ALL") {
        translate ([0, 0, height+fatPCB_height+1.2]) part_C ("2miniPCB_vent");
    }
}

module HWE211 (value) { //Battery + CO2 + Core + LCD (Tags inside)
    width= 88.15;
    height= 46.8;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 11.6;

    numberPrint("211",value);
    if (value=="A" || value=="B" || value=="ALL") {
        difference() {
                translate([0,0,height/2+wall/2]) {
                    hollowbox(width, height, holder_diff, value);
                    holder(width, height, holder_diff, holder_pos, value);
                    }
                translate([0,0, 25.3])
                    MiniSigfox1();
                translate([0 ,0, 37.8])
                    MiniCore21();
                translate([23, -8, 0]) mountingHoles3xx();
            }
        }
    if (value=="C" || value=="ALL") {
        translate ([0, 0, height+fatPCB_height+1.2]) { //comment
            part_C ("2vents");
        } //comment
    }
}

module HWE301 (value) { //Power + Core + Cover
    width= 88.15;
    height= 38.1;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 10.6;

    numberPrint("301",value);
    difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 24.7])
                MiniCore21();
            translate([0,0, 12])
                Power();
            translate([23, -8, 0]) mountingHoles3xx();
        } 
}

module HWE302 (value) { //Power + Core + Encoder + LCD
    width= 88.15;
    height= 50.6-3.5-1;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 10.6;

    numberPrint("303",value);
    if (value=="A" || value=="B" || value=="ALL") {
        difference() {
                translate([0,0,height/2+wall/2]) {
                    hollowbox(width, height, holder_diff, value);
                    holder(width, height, holder_diff, holder_pos, value);
                    }
                translate([0,0, 24.7])
                    MiniCore21();
                translate([0,0, 12])
                    Power();
                translate([23, -8, 0]) mountingHoles3xx();           
            } 
        }
    if (value=="C" || value=="ALL") {
        translate ([0, 0, height+fatPCB_height+1.2]) { //comment
            part_C ("encoder_LCD");
        } //comment
    }
}

module HWE303 (value) { //Power + Core + Encoder + LCD + Tags // TODO
    width= 88.15;
    height= 50.6-3.5-1;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 10.6;

    numberPrint("303",value);
    if (value=="A" || value=="B" || value=="ALL") {
        difference() {
                translate([0,0,height/2+wall/2]) {
                    hollowbox(width, height, holder_diff, value);
                    holder(width, height, holder_diff, holder_pos, value);
                    }
                translate([0,0, 24.7])
                    MiniCore21();
                translate([0,0, 12])
                    Power();
                translate([23, -8, 0]) mountingHoles3xx();           
            } 
        }
    if (value=="C" || value=="ALL") {
        translate ([0, 0, height+fatPCB_height+1.2]) { //comment
            part_C ("encoder_LCD");
        } //comment
    }
}

module HWE304 (value) { //Power + Sigfox + Core + Cover
    width= 88.15;
    height= 50.6;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 10.6;

    numberPrint("304",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 37])
                MiniCore21();
            translate([0,0, 24.9])
                MiniSigfox1();
            translate([0,0, 12])
                Power();
            translate([23, -8, 0]) 
                mountingHoles3xx();
        }
    }   
module HWE305 (value) { //Power + Sigfox + CO2 + Core + Cover
    width= 88.15;
    height= 62.4;
    holder_diff = fatPCB_height+PCB_tolerance;
    holder_pos = 10.6;

    numberPrint("305",value);
        difference() {
            translate([0,0,height/2+wall/2]) {
                hollowbox(width, height, holder_diff, value);
                holder(width, height, holder_diff, holder_pos, value);
                }
            translate([0,0, 49.5])
                MiniCore21();
            translate([0,0, 25.4])
                MiniSigfox1();
            translate([0,0, 12])
                Power();
            translate([23, -8, 0]) 
                mountingHoles3xx();
    }
}

module HWE501 (value) { //Mini Battery + Sensor + Core + Flood Detector
    width= 38;
    rim1=3.7;
    rim2=1.9;
    
    numberPrintFlood("501",value);
    if (value=="A") {
        translate ([0, 0, rim1+rim2+wall]) rotate ([0, 180, 0]) box_flood_detector_partA(width, rim1, rim2);
        }
    if (value=="B") {
        difference () {
            box_flood_detector_partB(width);
            translate ([0, 0, length-rim1]) box_flood_detector_partA(width, rim1, rim2);
            }
        }     
    if (value=="ALL") {
         translate ([0, 0, length-rim1]) box_flood_detector_partA(width, rim1, rim2);
         box_flood_detector_partB(width);
        }
} 

module HWE502 (value) { //Mini Battery + Sensor + Core + Flood Detector
    width= 50.8;
    rim1=3.7;
    rim2=1.9;

    numberPrintFlood("502",value);
    if (value=="A") {
        translate ([0, 0, rim1+rim2+wall]) rotate ([0, 180, 0]) box_flood_detector_partA(width, rim1, rim2);
        }
    if (value=="B") {
        difference () {
            box_flood_detector_partB(width);
            translate ([0, 0, length-rim1]) box_flood_detector_partA(width, rim1, rim2);
            }
        }     
    if (value=="ALL") {
         translate ([0, 0, length-rim1]) box_flood_detector_partA(width, rim1, rim2);
         box_flood_detector_partB(width);
        }
} 

 
module numberPrint(number, part){ // part = ["A","B","ALL"], number = ["serial_number"]
    if (part=="A") {
        translate([0,22,2]) linear_extrude(height = 0.2){ 
        text(str(number,"A"), font = "arial:style=Bold",valign="center",halign="center", size = 6);
        }
    }
    if (part=="B") {
        translate([0,-5.7,2]) linear_extrude(height = 0.2){ 
        text(str(number,"B"), font = "arial:style=Bold",valign="center",halign="center", size = 6);
        }
    }
    if (part=="ALL") {
        translate([0,22,2]) linear_extrude(height = 0.2){ 
        text(str(number,"A"), font = "arial:style=Bold",valign="center",halign="center", size = 6);
        }
        translate([0,-5.7,2]) linear_extrude(height = 0.2){ 
        text(str(number,"B"), font = "arial:style=Bold",valign="center",halign="center", size = 6);
        }        
    }
}


module numberPrintFlood(number, part){ // part = ["A","B","ALL"], number = ["serial_number"]
    if (part=="A") {
        translate([0,0,2]) linear_extrude(height = 0.2){ 
        text(str(number,"A"), font = "arial:style=Bold",valign="center",halign="center", size = 6);
        }
    }
    if (part=="B") {
        translate([0,-6.5,-7.6]) linear_extrude(height = 0.2){ 
        text(str(number,"B"), font = "arial:style=Bold",valign="center",halign="center", size = 6);
        }
    }
}

module box_flood_detector_partA (width, rim1, rim2) {
    difference () {
        translate ([0, 0, (rim1)/2]) roundedBox([width+2*wall, MiniPCB_width+3*wall+flood_detector_width, rim1], radius+wall, sidesonly=sidesonly);
        translate ([0, 0, (rim1)/2]) roundedBox([width+wall, MiniPCB_width+wall+flood_detector_width+wall, rim1], radius+wall/2, sidesonly=sidesonly);
    }
    
    difference () {
            translate ([0, 0, (rim2)/2+rim1]) roundedBox([width+2*wall, MiniPCB_width+3*wall+flood_detector_width, rim2], radius+wall, sidesonly=sidesonly);
            translate ([0, 0, (rim2)/2+rim1]) roundedBox([width, MiniPCB_width+flood_detector_width+wall, rim2], radius, sidesonly=sidesonly);
    }
    translate ([0, 0, +rim1+rim2+(wall)/2]) roundedBox([width+2*wall, MiniPCB_width+3*wall+flood_detector_width, wall], radius+wall, sidesonly=sidesonly);
    }

module box_flood_detector_partB (width) {
    stair = 7.58;
    translate([0,0,length/2]) {
        difference () {
            roundedBox([width+2*wall, MiniPCB_width+3*wall+flood_detector_width, length], radius+wall, sidesonly=sidesonly);
            roundedBox([width, MiniPCB_width+flood_detector_width+wall, length], radius, sidesonly=sidesonly);
            }
    }
     
    translate ([0, 0, (-stair-wall)/2]) {
       difference () {
            roundedBox([width+2*wall, MiniPCB_width+3*wall+flood_detector_width, stair+wall], radius+wall, sidesonly=sidesonly);
            translate ([0, 0, wall/2]) roundedBox([width, MiniPCB_width+flood_detector_width+wall, stair], radius, sidesonly=sidesonly);
            translate ([-(width+2*wall)/2, (MiniPCB_width+3*wall+flood_detector_width)/2-(flood_detector_width+2*wall), (-stair-wall)/2]) cube ([width+2*wall, flood_detector_width+2*wall, stair+wall]);
            }
    } 

    difference () {
            translate ([0, 0, wall/2]) roundedBox([width+2*wall, MiniPCB_width+3*wall+flood_detector_width, wall], radius+wall, sidesonly=sidesonly);
            difference () {
                translate ([0, 0, wall/2]) roundedBox([width, MiniPCB_width+flood_detector_width+wall, wall], radius, sidesonly=sidesonly);
                translate ([-(width+2*wall)/2, (MiniPCB_width+3*wall+flood_detector_width)/2-(flood_detector_width+2*wall), 0]) cube ([width+2*wall, flood_detector_width+2*wall, stair+wall]);
            }
            translate ([2.3, (MiniPCB_width+3*wall+flood_detector_width)/2-flood_detector_contact_width-2.12-wall, 0]) cube ([flood_detector_contact_length, flood_detector_contact_width, wall]);
            translate ([-flood_detector_contact_length-2.3, (MiniPCB_width+3*wall+flood_detector_width)/2-flood_detector_contact_width-2.12-wall, 0]) cube ([flood_detector_contact_length, flood_detector_contact_width, wall]);
            }

    translate ([-(width+2*wall)/2, (MiniPCB_width+3*wall+flood_detector_width)/2-(flood_detector_width+2*wall), -stair-wall]) cube ([width+2*wall, wall, length+stair+wall]);
            
    translate ([-(width+2*wall)/2, (MiniPCB_width+3*wall+flood_detector_width)/2-2*wall-flood_detector_width-6, -stair-wall]) cube ([width+2*wall, wall, stair+wall]);
    translate ([-(width+2*wall)/2, -(MiniPCB_width+3*wall+flood_detector_width)/2+6, -stair-wall]) cube ([width+2*wall, wall, stair+wall]);
       
    translate ([-wall-flood_detector_length/2, (MiniPCB_width+wall-flood_detector_width)/2, 0]) cube ([wall, flood_detector_width, length]);
    translate ([+flood_detector_length/2, (MiniPCB_width+wall-flood_detector_width)/2, 0]) cube ([wall, flood_detector_width, length]);
}

module screwHole() { 
    color("silver")
    union(){
        cylinder(d=3.1, h=2);
        translate([0,0,0.3])
        cylinder(d1=3.1, d2=7.3, h=1.8);
    }
}
module holder(width, height, holder_diff, holder_pos, value) {
    if (value=="A") {
        difference() {
            holderBase(width, height, holder_diff, holder_pos);
            translate([0,0,-height/2-wall/2]) cut (width, height);
        }
       }
    if (value=="B") {
        difference() {
            intersection() {
            holderBase(width, height, holder_diff, holder_pos);
            translate([0,0,-height/2-wall/2]) cut (width, height);
            }
        }
       }
    if (value=="ALL") {
        holderBase(width, height, holder_diff, holder_pos);
        }
}
module holderBase(width, height, holder_diff, holder_pos) { //PCB SLOT HOLDER
    w = width + 2*wall;
    l = length + 2*wall;
    h = height + wall;
    holder_tpos = (-h/2) + wall/2 + holder_pos;
    hl = length - wall;
    
difference(){
    union(){
                color([1,0,0])
 
        translate([-(width-holder_w)/2, 0, holder_tpos])
        cube([holder_w, hl, holder_h], center=true);
                color([1,1,0])
 
        translate([-(width-holder_w)/2, 0, holder_tpos + holder_diff + holder_h])
        cube([holder_w,hl, holder_h], center=true);
       
        translate([(width-holder_w)/2, 0, holder_tpos])
        cube([holder_w, hl, holder_h], center=true);
   
        translate([(width-holder_w)/2, 0, holder_tpos + holder_diff + holder_h])
        cube([holder_w, hl, holder_h], center=true);
        }
 
// PART A RAMP
    // TOP
    translate([(width-holder_w)/2 + holder_w/2,
                cut_length+holder_h/2,
                -holder_h/2+holder_tpos + holder_diff + holder_h])
    rotate ([90,0,-90])
                color([1,0,0])
 
    triangle(holder_short*holder_h, holder_short*holder_h, holder_w,center=false);
 
 
    // BOT
    translate([(width-holder_w)/2 + holder_w/2-holder_w,
                cut_length-0.28,
                -holder_h/2+holder_tpos + holder_h]) //todo
    rotate ([-90,0,-90])
                        color([1,1,0])
 
    triangle(2*holder_h, 2*holder_h, holder_w,center=false);
 
    // TOP
    translate([-(width-holder_w)/2 + holder_w/2,
                cut_length+holder_h/2,
                -holder_h/2+holder_tpos + holder_diff + holder_h])
    rotate ([90,0,-90])
            color([0,0,1])
 
    triangle(holder_short*holder_h, holder_short*holder_h, holder_w,center=false);
 
    // BOT
 
    translate([-(width-holder_w)/2 + holder_w/2-holder_w,
                cut_length-0.28,
                -holder_h/2+holder_tpos + holder_h]) //todo
    rotate ([-90,0,-90])
                color([0,1,1])
 
    triangle(2*holder_h, 2*holder_h, holder_w,center=false);
 
//PART B RAMP (nabeh drazky pro DPS)
 
    //TOP
    translate([(width-holder_w)/2 + holder_w/2,
                cut_length+holder_h/2,
                -holder_h/2+holder_tpos + holder_diff + holder_h])
    rotate ([90,-90,-90])
                    //color([0,1,0])
 
    triangle(holder_h, holder_h, holder_w,center=false);
 
    // BOT
    translate([(width-holder_w)/2 + holder_w/2-holder_w,
                cut_length-0.28,
                -holder_h/2+holder_tpos + holder_h]) //todo
    rotate ([-90,+90,-90])
                    color([0,1,0])
 
    triangle(holder_h, holder_h, holder_w,center=false);
 
    // TOP
    translate([-(width-holder_w)/2 + holder_w/2,
                cut_length+holder_h/2,
                -holder_h/2+holder_tpos + holder_diff + holder_h])
    rotate ([90,-90,-90])
    triangle(holder_h, holder_h, holder_w,center=false);
 
    // BOT
    translate([-(width-holder_w)/2 + holder_w/2-holder_w,
                cut_length-0.28,
                -holder_h/2+holder_tpos + holder_h]) //TODO
    rotate ([-90,90,-90])
                //color([0,1,0])
    triangle(holder_h, holder_h, holder_w,center=false);
   
    }
}
 
module hollowbox(width, height, holder_diff, value) {
    if (value=="A") {
        difference() {
            hollowboxBase(width, height, holder_diff);
            translate([0,0,-height/2-wall/2]) cut (width, height);
        }
       }
    if (value=="B") {
        difference() {
            intersection() {
            hollowboxBase(width, , height, holder_diff);
            translate([0,0,-height/2-wall/2]) cut (width, height);
            }
        }
       }
    if (value=="ALL") {
        hollowboxBase(width, height, holder_diff);
        }
}
module hollowboxBase(width, height, holder_diff) { 
    w = width + 2*wall;
    l = length + 2*wall;
    h = height + wall;
    difference () {
        union () {
            if (radius > 0) difference(){
                roundedBox([w, l, h], radius+wall, sidesonly=sidesonly);
                intersection(){
                    translate([0, 0, wall/2+10])
                    roundedBox([w - 2*wall, l - 2*wall, h-wall+20], radius, sidesonly=1);
                    translate([0, 0, wall/2+10])
                    rotate([90,0,0])
                    roundedBox([w - 2*wall, h-wall+20,l - 2*wall], radius_bot, sidesonly=1);
                }          
            } else difference() {
                cube([w, l, h], center=true);
                cube([w-2*wall, l-2*wall, h-wall], center=true);
            }
       }        
        ring(ring_top_pos, w, l, h);
        ring(h-ring_bottom_pos, w, l, h);
    }  
}
 
module cut(width, height){

    ll = tan(45) * wall;
    w = width + 2*wall;
    l = length + 2*wall;
    h = height + wall;
    CubePoints = [
      [  0,  0,  0 ],  //0
      [ w,  0,  0 ],  //1
      [ w-wall,  ll,  0 ],  //2
      [ wall,  ll,  0 ],  //3
      [ 0,  0,  h+0.2 ],  //4
      [ w,  0,  h+0.2 ],  //5
      [ w-wall,  ll,  h+0.2 ],  //6
      [ wall,  ll,  h+0.2 ]]; //7
     
    CubeFaces = [
      [0,1,2,3],  // bottom
      [4,5,1,0],  // front
      [7,6,5,4],  // top
      [5,6,2,1],  // right
      [6,7,3,2],  // back
      [7,4,0,3]]; // left
 
// CUT LOCK
    translate([-w/2,l/2 - cut_length, 0])
    polyhedron( CubePoints, CubeFaces );
   
    translate([0, -cut_length , +h/2])
    cube([w+0.2,l ,h + 0.2], center=true);
}
 
module ring(pos, w, l, h) { 
    ring_pos = h/2-pos;
    rw = radius + wall;
   
    tw = w/2 + 0.0;
    tl = l/2 +0.0;
 
    if (previw_mode == 0){
        translate([-tw, tl, ring_pos])
        ringCorner(w, l, h);
       
        translate([tw, tl, ring_pos])
        rotate([0,0,-90])
        ringCorner(w, l, h);
       
        translate([-tw, -tl, ring_pos])
        rotate([0,0,90])
        ringCorner(w, l, h);
   
        translate([tw, -tl, ring_pos])
        rotate([0,0,180])
        ringCorner(w, l, h);
   
    }
    translate([-tw, -tl, ring_pos])
    rotate([0,90,0])
    cylinder(r=ring_r,h=w);
   
    translate([-tw, tl, ring_pos])
    rotate([0,90,0])
    cylinder(r=ring_r,h=w);
   
    translate([-tw, tl, ring_pos])
    rotate([90,0,0])
    cylinder(r=ring_r,h=l);
 
    translate([tw, tl, ring_pos])
    rotate([90,0,0])
    cylinder(r=ring_r,h=l);
}
 
module ringCorner(w, l, h) {
    rw = radius + wall;
    translate([rw, -rw, 0 ])
    rotate([-90,0,0]) elbow(0,90,ring_r,radius);
    }
 
module elbow(startAngle,stopAngle,r,rad){
    h = 1.175*3.14*2*(rad+2*r)*step/360;
        for(i = [startAngle:step:stopAngle]) {
            rotate([0,i,0])
            translate([-rad-2*r,0,-h/2])
                cylinder(r=r, h=h);
        }
}
 
module terminal185mm () { //5pin
    translate ([0, 0, -terminal185mm_bottom_recess]) cube ([terminal185mm_width, terminal185mm_length/2, terminal185mm_bottom_recess]); 
    translate ([0, 0, 0]) cube ([terminal185mm_width, terminal185mm_length, terminal185mm_height]);
    translate ([0, 0, terminal185mm_height]) cube ([terminal185mm_width, terminal185mm_length/2, terminal185mm_upper_recess]); 
    }
 
 
module screw_2D(mountingHoles_distanece){
    translate([mountingHoles_distanece, 0, 0]){
    square([screw_size, screw_hole_height]); // TODO: add square points to polygon
    polygon([[-2,screw_hole_height], [2+screw_size,screw_hole_height], [screw_size,0.6], [0,0.6]]);
    }    
}
 
module magnetHole(){
    cylinder(d=screw_size, h=screw_hole_height);
    translate([0,0,0.6]) cylinder(d1=screw_size, d2=screw_hole_top_size, h=screw_hole_height-0.6);
}
module mountingHoles1xx(){ // holes 1xx boxes
    mountingHoles_distanece=28;
    rotate ([0, 0, -90]) {
           magnetHole(); // center hole

        // adjustment hole
        rotate_extrude(angle=screw_hole_angle/2, convexity=2,$fn=100) screw_2D(mountingHoles_distanece);
        rotate_extrude(angle=-screw_hole_angle/2, convexity=2,$fn=100) screw_2D(mountingHoles_distanece);
        rotate(a=screw_hole_angle/2, v=[0,0,1]) translate([mountingHoles_distanece+screw_size/2, 0, 0]) magnetHole();
        rotate(a=-screw_hole_angle/2, v=[0,0,1]) translate([mountingHoles_distanece+screw_size/2, 0, 0]) magnetHole();
            }
} 
module mountingHoles3xx(){ // holes 3xx boxes
        mountingHoles_distanece=47;
        rotate ([0, 0, 180]) {
           magnetHole(); // center hole
        translate ([25, -16, 0]) magnetHole();
        
        // adjustment hole
        rotate_extrude(angle=screw_hole_angle/2, convexity=2,$fn=100) screw_2D(mountingHoles_distanece);
        rotate_extrude(angle=-screw_hole_angle/2, convexity=2,$fn=100) screw_2D(mountingHoles_distanece);
        rotate(a=screw_hole_angle/2, v=[0,0,1]) translate([mountingHoles_distanece+screw_size/2, 0, 0]) magnetHole();
        rotate(a=-screw_hole_angle/2, v=[0,0,1]) translate([mountingHoles_distanece+screw_size/2, 0, 0]) magnetHole();
            }
}
module MiniUSB () {
    minkowski() {
        translate([0, 0, USBmicro_height/2])
        cube([USBmicro_width, USBmicro_length/2 ,USBmicro_height], center=true);
        rotate ([-90, 0, 0])
            cylinder(h=USBmicro_length/2, r=r_MiniUSB);
    }
 
    translate([-((USBmicro_hole_span-USBmicro_hole)/2), 0, USBmicro_height/2]){
        rotate([-90,0,0]) {
            hull() {
                cylinder(h=wall+0.1, d=USBmicro_hole);
                translate([USBmicro_hole_span-USBmicro_hole,0,0])
                    cylinder(h=wall+0.1, d=USBmicro_hole);
            }        
        }          
    }
}
   
module MiniPCB () {
    d_holder=2.9;
    x_holder=1.9;
    y_holder=1.5;
    PCB_holder=7;
    
    roundedBox([MiniPCB_width , length, PCB_height], PCB_radius, sidesonly=sidesonly);
}

module fatMiniPCB () {
    d_holder=2.9;
    x_holder=1.9;
    y_holder=1.5;
    PCB_holder=7;

    roundedBox([MiniPCB_width , length, fatPCB_height], PCB_radius, sidesonly=sidesonly);
}

module PCB () {
    roundedBox([PCB_width , length, PCB_height], PCB_radius, sidesonly=sidesonly);
}
     
module fatPCB () {
    roundedBox([PCB_width , length, fatPCB_height], PCB_radius, sidesonly=sidesonly);
}

module MiniCore21 () {
    translate ([0,0,fatPCB_height/2])
    fatMiniPCB ();
    translate([0,-length/2-wall,0])
        MiniUSB ();
}

module MiniBridge () {
    translate ([0,0,PCB_height/2])
    MiniPCB ();
    translate([0,-length/2-wall,-0.8])
        MiniUSB ();
}
 
module MiniSensorModuleR11() {
   translate ([0, 0, 0]) fatMiniPCB ();
   translate ([(MiniPCB_width/2)-(MiniPCB_width/2)-(terminal185mm_width/2), -length/2-terminal185mm_length, fatPCB_height/2+0.9]) terminal185mm ();   
    }
module MiniSensorModuleR10() { //1-wire
   translate ([0, 0, 0]) fatMiniPCB ();
   translate ([(MiniPCB_width/2)-(MiniPCB_width/2)-(terminal15mm_width/2), -length/2-terminal15mm_length, +fatPCB_height/2-terminal15mm_bottom_recess+0.1]) terminal15mm ();   
    }  
module MiniSigfox1 () {
    translate ([0,0,fatPCB_height/2])
    fatMiniPCB ();
    translate ([0, length/2, 2.1]) {
            rotate ([-90, 0, 0])
            cylinder (h=wall, r=r_wifi_antenna);
    }
}


module MiniRelay () {
    translate ([0,0,PCB_height/2])
    MiniPCB ();
    translate ([-(terminal12_3mm_width/2), -length/2-terminal12_3mm_length, +PCB_height-terminal12_3mm_bottom_recess+0.1]) 
        terminal12_3mm ();
    
} 
 
module terminal17mm(){ //3pin
   
    translate ([0, 0, terminal17mm_bottom_recess])
    cube([terminal17mm_width, wall+0.1, terminal17mm_height]); //díra na konektor
     
    translate([0,0, terminal17mm_bottom_recess+terminal17mm_height])
    cube([terminal17mm_width, wall/2, terminal17mm_upper_recess]); //horní zahloubení
   
        translate([0, 0, 0]) cube([terminal17mm_width, wall/2, terminal17mm_bottom_recess]); //dolni zahloubení
   
    translate ([(terminal17mm_width-key_x_roof)/2, 0 , terminal17mm_bottom_recess+terminal17mm_height+terminal17mm_upper_recess-key_height_wall-key_height_roof]) {
        key ();
        }  
}
module terminal15mm(){ //3pin
   
    translate ([0, 0, terminal15mm_bottom_recess])
    cube([terminal15mm_width, wall+0.1, terminal15mm_height]); //díra na konektor
     
    translate([0,0, terminal15mm_bottom_recess+terminal15mm_height])
    cube([terminal15mm_width, wall/2, terminal15mm_upper_recess]); //horní zahloubení
   
        translate([0, 0, 0]) cube([terminal15mm_width, wall/2, terminal15mm_bottom_recess]); //dolni zahloubení 
} 
module key () {
    translate([0, 0, 0]) cube([key_width_wall, key_length_wall+0.1, key_height_wall]); //left
    translate([key_x_roof-key_width_wall, 0, 0]) cube([key_width_wall, key_length_wall+0.1, key_height_wall]);// pravy
    translate([0, 0, key_height_wall]) cube([key_x_roof, key_y_roof+0.1, key_height_roof]); // right
    }
 
module terminal12_3mm () { //3pin   
    translate([0, 0, terminal12_3mm_bottom_recess]) cube([terminal12_3mm_width, terminal12_3mm_length+0.1, terminal12_3mm_height]); //otvor
    //prava svorka spodni zhloubeni
    translate([0, 0, 0]) cube([terminal12_3mm_width, terminal12_3mm_length/2, terminal12_3mm_bottom_recess]); //spodni zahloubeni
    translate([0, 0, terminal12_3mm_bottom_recess+terminal12_3mm_height]) cube([terminal12_3mm_width, terminal12_3mm_length/2, terminal12_3mm_upper_recess]); //horni zahloubeni
    }
 
module Power () {
    hole_jack_width=10.6;
    hole_jack_length=wall;
    hole_jack_height=9.5;
    
    translate ([0,0,fatPCB_height/2])
    fatPCB ();
    translate ([-PCB_width/2+4.2, -length/2-wall, -terminal17mm_bottom_recess+fatPCB_height])terminal17mm ();
    translate ([PCB_width/2-4.65-terminal12_3mm_width, -length/2-wall, -terminal12_3mm_bottom_recess+fatPCB_height]) terminal12_3mm ();
    translate([-hole_jack_width/2, -length/2-wall, +fatPCB_height])
        cube([hole_jack_width, hole_jack_length, hole_jack_height]);
   
    }
 
module cover_miniPCB (cover_height) {
    corner_radius=1.5;
    d_holder=2.9;
    x_holder=1.9; 
    y_holder=1.5;
    PCB_holder=7;
    width_tol=0.25; //correction for better fixing
    length_tol=-0.25; //correction for better fixing
     
    
    difference () {
        translate ([0, 0, cover_height/2-fatPCB_height-0.4]) roundedBox([MiniPCB_width+2*wall, length+2*wall, cover_height], radius+wall, sidesonly=sidesonly);
        
        translate ([0, 0, cover_height/2-fatPCB_height-0.4]) roundedBox([MiniPCB_width + width_tol, length + length_tol, cover_height], PCB_radius, sidesonly=sidesonly);  
        
        }
    difference () {
        translate ([0, 0, -1.5]) roundedBox([MiniPCB_width + width_tol , length, 1], PCB_radius, sidesonly=sidesonly);  
        
        translate ([0, 0, -1.5]) cube ([MiniPCB_width-2*PCB_holder, length, 1], center=true);
        translate ([0, 0, -1.5]) cube ([MiniPCB_width + width_tol, length-2*PCB_holder, 1], center=true);
        translate ([-MiniPCB_width/2+PCB_holder-corner_radius, -length/2+PCB_holder-corner_radius, -2]) corner_miniPCB_hole (corner_radius);  
        translate ([+MiniPCB_width/2-PCB_holder+corner_radius, -length/2+PCB_holder-corner_radius, -2]) rotate ([0, 0, 90]) corner_miniPCB_hole (corner_radius);
        translate ([+MiniPCB_width/2-PCB_holder+corner_radius, +length/2-PCB_holder+corner_radius, -2]) rotate ([0, 0, 180]) corner_miniPCB_hole (corner_radius); 
        translate ([-MiniPCB_width/2+PCB_holder-corner_radius, +length/2-PCB_holder+corner_radius, -2]) rotate ([0, 0, 270]) corner_miniPCB_hole (corner_radius);
        }
    
    /*translate ([MiniPCB_width/2-PCB_holder+x_holder+d_holder/2, length/2-PCB_holder+y_holder+d_holder/2, -2+1]) cylinder (h=fatPCB_height, d=d_holder);
    translate ([-MiniPCB_width/2+PCB_holder-x_holder-d_holder/2, length/2-PCB_holder+y_holder+d_holder/2, -2+1]) cylinder (h=fatPCB_height, d=d_holder);
    translate ([-MiniPCB_width/2+PCB_holder-x_holder-d_holder/2, -length/2+PCB_holder-y_holder-d_holder/2, -2+1]) cylinder (h=fatPCB_height, d=d_holder);
    translate ([MiniPCB_width/2-PCB_holder+x_holder+d_holder/2, -length/2+PCB_holder-y_holder-d_holder/2, -2+1]) cylinder (h=fatPCB_height, d=d_holder);*/
    }


module corner_miniPCB_hole (corner_radius) {
    difference () {
        cube ([corner_radius, corner_radius, 1]);
        cylinder (h=1, r=corner_radius);
        }
    
    }
module cover_vents (x) {
    for (y=[-length/2+wall:2+2:+length/2])
        translate ([0 , y, -0.8]) {
            hull () {
                cylinder (h=fatPCB_height, d=2);
                translate ([x, 0, 0]) cylinder (h=fatPCB_height, d=2);
            }
        } 
    
    }
    
module cover_tag () {
    
    translate ([8.2, 16.5/2, PCB_height/2]) roundedBox([16.5, 16.5, PCB_height], radius, sidesonly=sidesonly);
    cube ([12.2, 16.5, PCB_height]);
    translate ([0, 0, -fatPCB_height]) cube ([3.2, 16.5, fatPCB_height]);
    
    }
    
module part_C (value) {
    width= 88.15; 
    height= 34.4; 
    vents_length = 21;
    tag = 16.5; 
    
    if (value == "3tags_vent") {
        cover_height=16.4;
        vents_length = 21;
                    difference () {
                roundedBox([width+2*wall, length+2*wall, fatPCB_height], radius+wall, sidesonly=sidesonly);
                    
                translate ([0, 0, 0]) roundedBox([MiniPCB_width+2*wall, length+2*wall, 4], radius+wall, sidesonly=sidesonly);
                
                translate ([-width/2+wall, 0, 0]) cover_vents (vents_length);
                
                translate ([+width/2-vents_length-wall+6.2, -length/2+1.77, +fatPCB_height/2-PCB_height]) cover_tag ();
                translate ([+width/2-vents_length-wall+6.2, -length/2+1.77+tag+1.6, +fatPCB_height/2-PCB_height]) cover_tag ();
                
                translate ([+width/2-vents_length-wall+6.2, -length/2+1.77+2*tag+2*1.6-0.5, +fatPCB_height/2-PCB_height]) cover_tag ();
                        
            
            }
             
            difference () {
                 translate ([0, 0, 1.2]) cover_miniPCB (cover_height);
                 translate([-22/2 , -length/2-wall, -height-2*fatPCB_height-1.2+37.8]) cube ([22, wall, cover_height-5]);
                 translate([-22/2 , length/2, -height-2*fatPCB_height-1.2+37.8]) cube ([22, wall, cover_height-5]);
                 }
          }
    if (value == "2vents") {
            vents_length = 21;
            cover_height=4; 
            difference () {
             
                roundedBox([width+2*wall, length+2*wall, fatPCB_height], radius+wall, sidesonly=sidesonly);
                translate ([0, 0, 0]) roundedBox([MiniPCB_width+2*wall, length+2*wall, 4], radius+wall, sidesonly=sidesonly);
                translate ([-width/2+wall, 0, 0]) cover_vents (vents_length);
                translate ([+width/2-vents_length-wall, 0, 0]) cover_vents (vents_length);
                        
            
            }
            translate ([0, 0, 1.2]) cover_miniPCB (cover_height);
        }
    if (value == "2miniPCB_vent") {
       cover_height=4;    
        difference () {
             
                roundedBox([width+2*wall, length+2*wall, fatPCB_height], radius+wall, sidesonly=sidesonly);
                translate ([-(width+2*wall)/2+(MiniPCB_width+2*wall)/2, 0, 0]) roundedBox([MiniPCB_width+2*wall, length+2*wall, 4], radius+wall, sidesonly=sidesonly);
                translate ([+(width+2*wall)/2-(MiniPCB_width+2*wall)/2, 0, 0]) roundedBox([MiniPCB_width+2*wall, length+2*wall, 4], radius+wall, sidesonly=sidesonly);
                translate ([-vents_length/2, 0, 0]) cover_vents (vents_length); 
                        
            
            }
            translate ([-(width+2*wall)/2+(MiniPCB_width+2*wall)/2, 0, 1.2]) cover_miniPCB (cover_height);
            translate ([+(width+2*wall)/2-(MiniPCB_width+2*wall)/2, 0, 1.2]) cover_miniPCB (cover_height);
        }
    if (value == "2miniPCB_2tags") {
       vents_length = 21;
       cover_height=4;
     
        difference () {
             
                roundedBox([width+2*wall, length+2*wall, fatPCB_height], radius+wall, sidesonly=sidesonly);
                translate ([-(width+2*wall)/2+(MiniPCB_width+2*wall)/2, 0, 0]) roundedBox([MiniPCB_width+2*wall, length+2*wall, 4], radius+wall, sidesonly=sidesonly);
                translate ([+(width+2*wall)/2-(MiniPCB_width+2*wall)/2, 0, 0]) roundedBox([MiniPCB_width+2*wall, length+2*wall, 4], radius+wall, sidesonly=sidesonly);
                translate ([-width/2+MiniPCB_width+wall+1.6, -length/2+8, 0]) cover_tag ();
                translate ([-width/2+MiniPCB_width+wall+1.6, length/2-tag-8, 0]) cover_tag ();
                        
            
            }
            translate ([-(width+2*wall)/2+(MiniPCB_width+2*wall)/2, 0, 1.2]) cover_miniPCB (cover_height);
            translate ([+(width+2*wall)/2-(MiniPCB_width+2*wall)/2, 0, 1.2]) cover_miniPCB (cover_height);
        }
     
    if (value == "2miniPCB") {
       vents_length = 21;
       cover_height=4;
     
        difference () {
             
                roundedBox([width+2*wall, length+2*wall, fatPCB_height], radius+wall, sidesonly=sidesonly);
                translate ([-(MiniPCB_width)/2-1.5, 0, 0]) roundedBox([MiniPCB_width+2*wall, length+2*wall, 4], radius+wall, sidesonly=sidesonly);
                translate ([+(MiniPCB_width)/2+1.5, 0, 0]) roundedBox([MiniPCB_width+2*wall, length+2*wall, 4], radius+wall, sidesonly=sidesonly);                       
            }
            translate ([-(MiniPCB_width)/2-1.5, 0, 1.2]) cover_miniPCB (cover_height);
            translate ([+(MiniPCB_width)/2+1.5, 0, 1.2]) cover_miniPCB (cover_height);
        }   
    if (value == "3tags_encoder") {
            d_encoder=16;
            cover_height=fatPCB_height+2.3; 
                    difference () {
                roundedBox([width+2*wall, length+2*wall, fatPCB_height], radius+wall, sidesonly=sidesonly); 
                           
                rotate ([0, 0, 180]) {
                translate ([+width/2-vents_length-wall+6.2, -length/2+1.77, +fatPCB_height/2-PCB_height]) cover_tag ();
                translate ([+width/2-vents_length-wall+6.2, -length/2+1.77+tag+1.6, +fatPCB_height/2-PCB_height]) cover_tag ();
                translate ([+width/2-vents_length-wall+6.2, -length/2+1.77+2*tag+2*1.6-0.5, +fatPCB_height/2-PCB_height]) cover_tag ();
                }
                
                translate ([(width/2-d_encoder/2)-5.6, 0, -fatPCB_height/2]) cylinder (h=fatPCB_height, d=d_encoder);
                
                translate ([0, 0, 0]) roundedBox([MiniPCB_width+2*wall, length+2*wall, 4], radius+wall, sidesonly=sidesonly);
                
            }
            translate ([0, 0, 1.2]) cover_miniPCB (cover_height);
           
      }
   
    if (value == "encoder") {
            d_encoder=16;
            cover_height=fatPCB_height+2.3;
            difference () {
                roundedBox([width+2*wall, length+2*wall, fatPCB_height], radius+wall, sidesonly=sidesonly);
                translate ([(width/2-d_encoder/2)-5.6, 0, -fatPCB_height/2]) cylinder (h=fatPCB_height, d=d_encoder);
                translate ([0, 0, 0]) roundedBox([MiniPCB_width+2*wall, length+2*wall, 4], radius+wall, sidesonly=sidesonly);
                }
            translate ([0, 0, 1.2]) cover_miniPCB (cover_height);
                
                
            }
    if (value == "encoder_LCD") {
            d_encoder=16;
            cover_height=fatPCB_height+2.9;
            difference () {
                roundedBox([width+2*wall, length+2*wall, fatPCB_height], radius+wall, sidesonly=sidesonly);
                translate ([(width/2-d_encoder/2)-5.6, 0, -fatPCB_height/2]) cylinder (h=fatPCB_height, d=d_encoder);
                translate ([0, 0, 0]) roundedBox([MiniPCB_width+2*wall, length+2*wall, 4], radius+wall, sidesonly=sidesonly);
                }
            translate ([0, 0, 1.2]) cover_miniPCB (cover_height);
            }
 }

//Render Image
module  print(model){ //model = HWE***
       
    //color = "Silver";
    color = [250/255, 70/255, 55/255]; // Red color
    offset = -3;
    offset2 = 3;
    
    if (model == "HWE101") {
        color(color) render(){ // render in color 
            HWE101("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE101("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE102") {
        color(color) render(){ // render in color 
            HWE102("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE102("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE103") {
        color(color) render(){ // render in color 
            HWE103("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE103("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE104") {
        color(color) render(){ // render in color 
            HWE104("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE104("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE105") {
        color(color) render(){ // render in color 
            HWE105("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE105("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE106") {
        color(color) render(){ // render in color 
            HWE106("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE106("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE107") {
        color(color) render(){ // render in color 
            HWE107("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE107("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE108") {
        color(color) render(){ // render in color 
            HWE108("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE108("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE109") {
        color(color) render(){ // render in color 
            HWE109("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE109("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE404") {
        color(color) render(){ // render in color 
            HWE401("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE401("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE402") {
        color(color) render(){ // render in color 
            HWE402("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE402("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE201") {
        color(color) render(){ // render in color 
            HWE201("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE201("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE202") {
        color(color) render(){ // render in color 
            HWE202("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE202("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE203") {
        color(color) render(){ // render in color 
            HWE203("ALL"); //Battery + CO2 + Core + LCD (Tags ouside)            
            //HWE203("A"); //Mini Battery + Core + Mini Cover
            //translate([0,offset,0]) HWE203("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE204") {
        color(color) render(){ // render in color 
            HWE204("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE204("B"); //Mini Battery + Core + Mini Cover
            translate([0,0,offset2]) HWE204("C"); //Battery R1.4 + CO2 + Core + LCD (Tags inside)            
        }
    }
    if (model == "HWE205") {
        color(color) render(){ // render in color 
            HWE205("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE205("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE206") {
        color(color) render(){ // render in color 
            HWE206("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE206("B"); //Mini Battery + Core + Mini Cover
            translate([0,0,offset2]) HWE206("C"); //Battery + CO2 + Sigfox + Core + LCD (Tags inside)
        }
    }
    if (model == "HWE207") {
        color(color) render(){ // render in color 
            HWE207("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE207("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE208") {
        color(color) render(){ // render in color 
            HWE208("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE208("B"); //Mini Battery + Core + Mini Cover
            translate([0,0,offset2]) HWE208("C"); //Battery + Core + Split + LCD & PIR (or LCD & Climate) & 2x Tag (intside)            
        }
    }
    if (model == "HWE209") {
        color(color) render(){ // render in color 
            HWE209("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE209("B"); //Mini Battery + Core + Mini Cover
            translate([0,0,offset2]) HWE209("C"); //Battery + Core + Compact Split + LCD & Climate
        }
    }
    if (model == "HWE210") {
        color(color) render(){ // render in color 
            HWE210("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE210("B"); //Mini Battery + Core + Mini Cover
            translate([0,0,offset2]) HWE210("C"); //Battery + Split Core & Split + LCD & GPS (or PIR & Climate) & No Tag
        }
    }
    if (model == "HWE211") {
        color(color) render(){ // render in color 
            HWE211("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE211("B"); //Mini Battery + Core + Mini Cover
            translate([0,0,offset2]) HWE211("C"); //Battery + Sigfox + Core + LCD (Tags inside)            
        }
    }
    if (model == "HWE301") {
        color(color) render(){ // render in color 
            HWE301("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE301("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE302") {
        color(color) render(){ // render in color 
            HWE302("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE302("B"); //Mini Battery + Core + Mini Cover
            translate([0,0,offset2]) HWE302("C"); //Power + Core + Encoder
        }
    }
    if (model == "HWE303") {
        color(color) render(){ // render in color 
            HWE303("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE303("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE304") {
        color(color) render(){ // render in color 
            HWE304("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE304("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE305") {
        color(color) render(){ // render in color 
            HWE305("A"); //Mini Battery + Core + Mini Cover
            translate([0,offset,0]) HWE305("B"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE501") {
        color(color) render(){ // render in color 
            HWE501("B"); //Mini Battery + Core + Mini Cover
            translate([60,-3,-5]) HWE501("A"); //Mini Battery + Core + Mini Cover
        }
    }
    if (model == "HWE502") {
        color(color) render(){ // render in color 
            HWE502("B"); //Mini Battery + Core + Mini Cover
            translate([60,-3,-5]) HWE502("A"); //Mini Battery + Core + Mini Cover
        }
    }    
}
