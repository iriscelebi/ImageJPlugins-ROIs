//IRIS Tool 12 
//Global Variables
var dia_spot = 260;
var dia_ref = 395;
var squareDim = 400;
var rows = 1;
var cols = 1;
var stepx = 390;
var stepy = 345;
var gname = 'Sample';

macro "Iris Tool 12 - C037T0d121T6d122"{

width=512; height=512;
Dialog.create("Iris tool");
Dialog.addString("Name:", gname);
Dialog.addNumber("Spot Dia: ",dia_spot);
Dialog.addNumber("Square Dim: ",squareDim);
Dialog.addNumber("Reference Dia: ",dia_ref);
Dialog.addNumber("Number of rows: ", rows);
Dialog.addNumber("Number of columns: ",cols);
Dialog.addNumber("Pitch size (x): ", stepx);
Dialog.addNumber("Pitch size (y): ", stepy);
Dialog.show();

gname = Dialog.getString();
dia_spot = Dialog.getNumber();
squareDim = Dialog.getNumber();
dia_ref = Dialog.getNumber();
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
		makeOval(initposx+stepx*i-dia_spot/2, initposy+stepy*j-dia_spot/2, dia_spot, dia_spot);
		roiManager("Add");
		N_a = roiManager("count");
		roiManager("Select",N_a-1);
		s_a = gname+i+'_'+j;
		roiManager("Rename",s_a);

		makeRectangle(initposx+stepx*i-squareDim/2, initposy+stepy*j-dia_ref/2, squareDim, dia_ref);
		 
		setKeyDown("alt");
		makeOval(initposx+stepx*i-dia_ref/2, initposy+stepy*j-dia_ref/2, dia_ref, dia_ref);

		setKeyDown("alt");
		makeRectangle(initposx+stepx*i-squareDim, initposy+stepy*j-60, squareDim*2, 120);

		setKeyDown("alt"); 
		makeOval(initposx+stepx*i-dia_ref/2, initposy+stepy*(j+1)-dia_ref/2, dia_ref, dia_ref);

		setKeyDown("alt");
		makeOval(initposx+stepx*i-dia_ref/2, initposy+stepy*(j-1)-dia_ref/2, dia_ref, dia_ref);

		setKeyDown("alt");
		makeOval(initposx+stepx*(i+1)-dia_ref/2, initposy+stepy*(j)-dia_ref/2, dia_ref, dia_ref);
		
		setKeyDown("alt");
		makeOval(initposx+stepx*(i-1)-dia_ref/2, initposy+stepy*(j)-dia_ref/2, dia_ref, dia_ref);
		setKeyDown("none");
		
		roiManager("Add");
		N_b = roiManager("count");
		roiManager("Select",N_b-1);
		s_b = gname+i+'_'+j+'_bg';
		roiManager("Rename",s_b);
		}
	}
}


