//GRID TOOL WITH BACKGROUND
//Global Variables
var radius_spot = 20;
var radius_bg = 30;
var rows = 5;
var cols = 5;
var stepx = 150;
var stepy = 150;
var gname = 'NameExample';

macro "Grid Tool wbg - C037T1d16B"{

width=512; height=512;
Dialog.create("Grid tool");
Dialog.addString("Name of the grid:", gname);
Dialog.addNumber("Spot radius: ",radius_spot);
Dialog.addNumber("Background radius: ",radius_bg);
Dialog.addNumber("Number of rows: ", rows);
Dialog.addNumber("Number of columns: ",cols);
Dialog.addNumber("Pitch size (x): ", stepx);
Dialog.addNumber("Pitch size (y): ", stepy);
Dialog.show();

gname = Dialog.getString();
radius_spot = Dialog.getNumber();
radius_bg = Dialog.getNumber();
rows  = Dialog.getNumber();
cols  = Dialog.getNumber();
stepx  = Dialog.getNumber();
stepy  = Dialog.getNumber();

run("ROI Manager...");
getCursorLoc(initposx, initposy, z, flags);

for (j = 0; j<rows; j++)
	{
	for (i = 0;i<cols; i++)
		{
		makeOval(initposx+stepx*i-radius_spot, initposy+stepy*j-radius_spot, radius_spot*2, radius_spot*2);
		roiManager("Add");
		N_a = roiManager("count");
		roiManager("Select",N_a-1);
		s_a = gname+i+'_'+j;
		roiManager("Rename",s_a);

		makeOval(initposx+stepx*i-radius_bg, initposy+stepy*j-radius_bg, radius_bg*2, radius_bg*2);
		setKeyDown("alt"); 
		makeOval(initposx+stepx*i-radius_spot, initposy+stepy*j-radius_spot, radius_spot*2, radius_spot*2);
		setKeyDown("none"); 
		roiManager("Add");
		N_b = roiManager("count");
		roiManager("Select",N_b-1);
		s_b = gname+i+'_'+j+'_bg';
		roiManager("Rename",s_b);
		}
	}
}


