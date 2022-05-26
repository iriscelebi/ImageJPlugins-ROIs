//GRID TOOL
//Global Variables
var radius = 20;
var rows = 5;
var cols = 5;
var stepx = 150;
var stepy = 150;
var gname = 'NameExample';

macro "Grid Tool - C037T1d16G"{

width=512; height=512;
Dialog.create("Grid tool");
Dialog.addString("Name of the grid:", gname);
Dialog.addNumber("Radius: ",radius);
Dialog.addNumber("Number of rows: ", rows);
Dialog.addNumber("Number of columns: ",cols);
Dialog.addNumber("Pitch size (x): ", stepx);
Dialog.addNumber("Pitch size (y): ", stepy);
Dialog.show();

gname = Dialog.getString();
radius = Dialog.getNumber();
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
		makeOval(initposx+stepx*i-radius, initposy+stepy*j-radius, radius*2, radius*2);
		roiManager("Add");
		N = roiManager("count");
		roiManager("Select",N-1);
		s = gname+i+'_'+j;
		roiManager("Rename",s);
		}
	}
}


