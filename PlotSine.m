clc   % Clears the command window
clear % Clears all Vars
close % Closes any figures

% Inputs:
nVals = 100;  % How many points are we going to use

% Create places to store data
x = linspace(0,360,nVals);   % 
y = zeros(size(x));          % Initiallise (create) y

% Now loop through each t value, then solve and stor x and y values
for i = 1:nVals
    y(i) = sind(x(i));
end

% Now do a pretty plot
figure
lineStyle = '-';  
plot(x,y,lineStyle)
strTitle = ["Sin(x)"];
title(strTitle);
grid on
xlabel("X")
ylabel("Y")
