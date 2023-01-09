function coffeeMachineSimulator()

  # Clear junk variables
  clear all;
  clc;

  # Close other frames
  close all;

  # Set up the GUI of the application
  setupGUI();

endfunction


function setupGUI()

  # Initilize needed variables
  primaryColor = '#787878'; secondaryColor = '#cdcdcd'; textColor = '#77AC30';
  data.coffeeOrderButtons = [];
  data.coffeeNames = cell(1, 6);
  data.coffeeNames{1} = "Black Coffee";
  data.coffeeNames{2} = "Coffee Light";
  data.coffeeNames{3} = "Cafe Late";
  data.coffeeNames{4} = "Cappuccino";
  data.coffeeNames{5} = "Cafe Mocha";
  data.coffeeNames{6} = "Hot Chocolate";

  # Set up all needed frames
  mainFrame = figure('position', [0 0 800 600], 'Name', 'Coffe Machine', 'NumberTitle', 'off','color', primaryColor,'toolbar','none', 'menubar', 'none','resize', 'off');
  titleFrame = uipanel('Parent', mainFrame, 'position', [0 .85 1 .15],'HighLightColor', primaryColor );

  rightHalf = uipanel('Parent', mainFrame, 'position', [0.5 0 0.5 .85],'backgroundcolor', primaryColor, 'HighLightColor', primaryColor );
  keypadFrame = uipanel('Parent', rightHalf, 'position', [0.05 0.3 0.5 0.5],'HighLightColor', primaryColor );
  coffeSlotFrame = uipanel('Parent', rightHalf, 'position', [0.6 0.3 0.35 0.5],'HighLightColor', primaryColor );

  leftHalf = uipanel('Parent', mainFrame, 'position', [0 0 .5 0.85],'backgroundcolor', primaryColor ,'HighLightColor', primaryColor );
  coffeeMenu = uipanel('Parent', leftHalf, 'position', [0.025 0.05 0.95 .9], 'backgroundcolor', primaryColor,'HighLightColor', primaryColor );

  # Set up all elements
  data.consoleOutput = uicontrol(rightHalf, 'Style', 'edit', 'units', 'normalized' ,"string", "plot title: (text)","position", [0.05 0.85 0.9 0.13], 'Max', 5, 'Min', 0, 'enable', 'off','backgroundcolor', '#000000');

  # Set up title
  uicontrol('parent', titleFrame, 'Style', 'text', 'units', 'normalized' ,"string", "IUS COFFEE","position", [0 0 1 1], 'backgroundcolor', primaryColor, 'fontsize', 18);

  # Set up KeyPad Buttons
  for i = 1:4
	  for j = 1:3
		  if (i != 4)
			  uicontrol(keypadFrame, 'Style', 'pushbutton', 'units', 'normalized' ,"string", num2str(3*(i-1) + j - 1),"position", [1/3*(j-1) 1-1/4*i 1/3 1/4], 'Max', 5, 'Min', 0, 'enable', 'on', 'fontsize', 14, 'backgroundcolor', secondaryColor);
		  else
			  if (j == 2)
				  uicontrol(keypadFrame, 'Style', 'pushbutton', 'units', 'normalized' ,"string", "9","position", [1/3 0 1/3 1/4], 'Max', 5, 'Min', 0, 'enable', 'on', 'fontsize', 14,'backgroundcolor', secondaryColor);
			  elseif (j == 1)
				  uicontrol(keypadFrame, 'Style', 'pushbutton', 'units', 'normalized' ,"string", "Yes","position", [0 0 1/3 1/4], 'Max', 5, 'Min', 0, 'enable', 'on', 'fontsize', 14,'backgroundcolor', secondaryColor);
			  else
				  uicontrol(keypadFrame, 'Style', 'pushbutton', 'units', 'normalized' ,"string", "No","position", [2/3 0 1/3 1/4], 'Max', 5, 'Min', 0, 'enable', 'on', 'fontsize', 14,'backgroundcolor', secondaryColor);
			  end
		  end
	  end
  end

  # Set up for coffee menu
  for i = 1:3
	  for j = 1:3
		  if (3*(i-1) + j > length(data.coffeeNames)) break; end
		  coffeeFrame = uipanel('Parent', coffeeMenu, 'position', [(j-1)/3 1-i/3 1/3 1/3],'HighLightColor', primaryColor , 'backgroundcolor',primaryColor );
		  axes('Parent', coffeeFrame,'position', [0 0.4 1 0.6], 'xtick', [], 'ytick', [], 'xlim', [0 1], 'ylim', [0 1], 'Color', primaryColor);
		  imshow(strcat('./Images/', data.coffeeNames{3*(i-1) + j}, '.png'), []);
		  uicontrol(coffeeFrame, 'Style', 'text', 'units', 'normalized' ,"string", num2str(3*(i-1) + j), "position", [0 0.2 1 0.2], 'enable', 'on', 'fontsize', 14, 'backgroundcolor',primaryColor );
		  uicontrol(coffeeFrame, 'Style', 'text', 'units', 'normalized' ,"string", data.coffeeNames{3*(i-1) + j}, "position", [0 0 1 0.2], 'enable', 'on', 'fontsize', 14, 'backgroundcolor',primaryColor );
	  end
  end

  guidata(mainFrame, data);

endfunction











