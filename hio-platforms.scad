/* 3D print platform for ABB enclosure and HARDWARIO IoT Kit

https://www.hardwario.com/
https://shop.hardwario.com/modules/

This project is licensed under the [Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/) - see the [LICENSE](LICENSE) file for details.
*/


$fn=50; //render detail setting


//ABB-00852 inner dimesnsion
abbX=150;   //x dimension
abbY=107;   //y dimension
a=27;       //box corner cut a dimension 
b=27;       //box corner cut b dimension
r=11;       //box corner cut radius

nodeH=12;   //installation height
h=5;       //platform height


//HARDWRIO module cut dimension
nodeX=88.6;     //x dimension
nodeY=55.6;     //y dimension
offsetX=23-15;  //x offset poition
nodeRad=2.5;    // corner radius
pcbH=1.5;       //module PCB heght


HWE901(); //ABB-00852 

//Platform can be used for mounting HARDWARIO IoT Kit module into ABB enclosure (up to 4 modules). 
//As a base floor module use Battery Module or Power Module 
module HWE901(){  
    difference(){
            cutedBase(abbX,abbY,a,b,h);             //base  platform
            nodecut(nodeX,nodeY,nodeRad,h+0.2,offsetX); //cut for module
            screwcut();                             //screw holes
            translate([0,0,-0.1]) gridcut(h+0.2);   //base platform opening
    }
    difference(){
        nodepole(nodeX,nodeY,offsetX,nodeH,pcbH);   //module spacer
        translate([-nodeY/2+offsetX,-15/2,nodeH-4]) cube([nodeY,15,4]);    // opening cut for Power Module
        nodescrew(offsetX,nodeH);                   //module spacer screw holes
    }    
    translate([-nodeY/2+offsetX,-12/2,0]) cube([nodeY,12,4]); //rail under module cut
    //ampmount(offsetX,0,nodeH); // optional holder for exetsion module
}

module cutedBase(A,B,a,b,h){
    difference(){
        base(abbX,abbY,h);
        translate([0,0,-0.1]) basecut(a,b,r,h+0.2);
    }
}
  
module base(a,b,h){
    translate([-a/2,-b/2,0]) cube([a,b,h]);
}
    
module basecut(a,b,r,h){
    translate([-abbX/2,-abbY/2,0]) fullpool(a,a,r,h);
    translate([+abbX/2,-abbY/2,0]) fullpool(a,a,r,h);
    translate([-abbX/2,+abbY/2,0]) fullpool(a,a,r,h);    
    translate([+abbX/2,+abbY/2,0]) fullpool(a,a,r,h);    
}

module nodecut(nodeX,nodeY,nodeRad,h,offsetX){ 
 translate([offsetX,0,-0.1])rotate([0,0,90])fullpool(nodeX,nodeY,nodeRad,h+0.1);
}
module screwcut(){
    r1=4.2/2; //srew hole
    r2=7.5/2; //screw head
    deep=0.6; //screw head deep
    
    //large hole
    translate([+118/2,+75/2,-0.1])  cylinder(r=13/2,h=3+0.1);
    translate([-118/2,+75/2,-0.1])  cylinder(r=13/2,h=3+0.1);
    translate([+118/2,-75/2,-0.1])  cylinder(r=13/2,h=3+0.1);
    translate([-118/2,-75/2,-0.1])  cylinder(r=13/2,h=3+0.1);

    //screw hole bottom
    translate([+(118/2+7),+(75/2-9),-0.1])  cylinder(r=7/2,h=3+0.1);
    translate([-(118/2+7),+(75/2-9),-0.1])  cylinder(r=7/2,h=3+0.1);
    translate([+(118/2+7),-(75/2-9),-0.1])  cylinder(r=7/2,h=3+0.1);
    translate([-(118/2+7),-(75/2-9),-0.1])  cylinder(r=7/2,h=3+0.1);
    
    //screw hole
    translate([+(118/2+7),+(75/2-9),-0.1])  cylinder(r=r1,h=h+0.1);
    translate([-(118/2+7),+(75/2-9),-0.1])  cylinder(r=r1,h=h+0.1);
    translate([+(118/2+7),-(75/2-9),-0.1])  cylinder(r=r1,h=h+0.1);
    translate([-(118/2+7),-(75/2-9),-0.1])  cylinder(r=r1,h=h+0.1);    
    
    //screw hole top
    translate([+(118/2+7),+(75/2-9),h-deep-0.1])  cylinder(r=r2,h=deep+0.2);
    translate([-(118/2+7),+(75/2-9),h-deep-0.1])  cylinder(r=r2,h=deep+0.2);
    translate([+(118/2+7),-(75/2-9),h-deep-0.1])  cylinder(r=r2,h=deep+0.2);
    translate([-(118/2+7),-(75/2-9),h-deep-0.1])  cylinder(r=r2,h=deep+0.2);    
    
    //rectangle hole bottom
    translate([+(118/2+7),+(75/2-14+0.5),-0.1]) fullpool(11,11,0.7,3+0.1);
    translate([+(118/2+7),-(75/2-14+0.5),-0.1]) fullpool(11,11,0.7,3+0.1);
    translate([-(118/2+7),+(75/2-14+0.5),-0.1]) fullpool(11,11,0.7,3+0.1);
    translate([-(118/2+7),-(75/2-14+0.5),-0.1]) fullpool(11,11,0.7,3+0.1);
}  

module gridcut(h){ 
    x=88/3.2;   //a length
    y=55/3.2;   //b lenght
    rad=2.5;
    dx=1.43*x;
    dy=1.76*y;
        
    translate([50,0,0]) fullpool(y,x,rad,h);
    translate([50,-dy,0]) fullpool(y,x,rad,h);
    translate([50,dy,0]) fullpool(y,x,rad,h);
    
    translate([-dx,0,0]) fullpool(y,x,rad,h);
    translate([-dx,-dy,0]) fullpool(y,x,rad,h);
    translate([-dx,dy,0]) fullpool(y,x,rad,h);    
    
    translate([-1.57*dx,0,0]) fullpool(55/2.81,x,rad,h);    
}
module nodepole(nodeX,nodeY,offsetX,h,pcbH){
    translate ([offsetX-nodeY/2+2,0,0])fullpool(7.2+4.5,34,2.5,h-pcbH);
    translate ([offsetX+nodeY/2-2,0,0])fullpool(7.2+4.5,34,2.5,h-pcbH);    
}

module nodescrew(offsetX,h){
    //node screw holes
    dy=25.4;    //y difference
    dx=47.4;    //x difference
    r=2.9/2;     //screw diameter
    
    translate([+(dx/2+offsetX),+(dy/2),-0.1])  cylinder(r=r,h=h+0.2);
    translate([(-dx/2+offsetX),+(dy/2),-0.1])  cylinder(r=r,h=h+0.2);
    translate([+(dx/2+offsetX),-(dy/2),-0.1])  cylinder(r=r,h=h+0.2);
    translate([(-dx/2+offsetX),-(dy/2),-0.1])  cylinder(r=r,h=h+0.2);
}

module ampmount(offsetX,offsetY,h){
    posX=10;
    posY=-49;
    x=19;
    y=8.2;
    x2=6;
    y2=23;
    
    h2=10;
    
    r=2.9/2; //screw diameter
    ds = 18; //roztec otvoru amp DPS
    
    difference(){
        union(){
            translate([offsetX-29-x2,offsetY+posY-1.5-3,0]) cube([x,y,h+h2]);
            translate([offsetX-29-x2,offsetY+posY-1.5,0]) cube([x2,y2,h+h2]);            
        }
        translate([offsetX-29-x2/2,offsetY+posY-3.5+x2/2,3])  cylinder(r=r,h=30);
        translate([offsetX-29-x2/2,offsetY+posY-3.5+x2/2+ds,3])  cylinder(r=r,h=30);
        translate([offsetX-29-x2,offsetY+posY-1.5+3.2,h+h2-2]) cube([6,14,2]);        
    }
}

//pool - rounded box
module pool(a,b,r,h){
    a1=(a-2*r);
    b1=(b-2*r);
    translate([-a1/2-r,-b1/2,0]) cube([2*r,b1,h]);
    translate([a1/2-r,-b1/2,0]) cube([2*r,b1,h]);
    translate([-a1/2,-b1/2-r,0]) cube([a1,2*r,h]);
    translate([-a1/2,+b1/2-r,0]) cube([a1,2*r,h]);      
    translate([-a1/2,-b1/2,0]) cylinder(r=r,h=h);
    translate([-a1/2,b1/2,0]) cylinder(r=r,h=h);
    translate([a1/2,-b1/2,0]) cylinder(r=r,h=h);
    translate([a1/2,b1/2,0]) cylinder(r=r,h=h);
}


//fullpool - filled rounded box
module fullpool(a,b,r,h){
        pool(a,b,r,h);
        a1=a-2*r;
        b1=b-2*r;
        translate([-a1/2,-b1/2,0]) cube([a1,b1,h]);        
} 

