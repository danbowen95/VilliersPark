% Bungee1
clc;
clear;
close all;

%% Inputs

% Time
dt = 0.05;      % Timestep (s)
Tmax = 50;      % Max time (s)
ninc = Tmax/dt; % Number of increments

% Jumper
m    = 80;          % Mass of jumper (Kg)
xTop = 72;          % Starting height
c    = 1.3;         % Coeff of drag
rho  = 1.225;       % Density of air
A    = 1.4;         % Area of jumper
CdA  = 0.5 * rho * c;

% Bungee
l = 50;    % Natural length of bungee
k = 100;   % Stiffness of bungee

% Set up vars to store data
t = linspace(0,Tmax,ninc);
x = zeros(size(t));   % Displacement
v = zeros(size(t));   % Velocity
a = zeros(size(t));   % Acceleration
F = zeros(size(t));   % Total force on jumper
Fb = zeros(size(t));   % Total force on jumper

%% Set initial conditions
x(1)  = xTop;
v(1)  = 0;
Fb(1) = 0;
F(1)  = m*9.81 - ( CdA * v(1)^2 );
a(1)  = -F(1) / m;


%% Loop thru and calc
for n = 2:ninc
    
    % Bungee force
    if x(n-1) < (xTop-l)
        d = xTop - l - x(n-1);
        Fb(n) = k * d;
    else
        Fb(n) = 0;
    end
    
    % Drag force
    if v(n-1) <= 0
        Fd(n) = CdA * (v(n-1)^2);
    else
        Fd(n) = -1 * CdA * (v(n-1)^2);
    end
    
    F(n)  = m*9.81 - Fd(n) - Fb(n);
    a(n)  = -F(n) / m;
    v(n)  = v(n-1) + (a(n)*dt);
    x(n)  = x(n-1) + (v(n)*dt);
end

figure
plot(t,Fb)


%% Do plot

figure
subplot(1,2,1)
plot(t,x)
grid on
xlabel('time')
ylabel('displacement')
subplot(1,2,2)
plot(t,v)
grid on
xlabel('time')
ylabel('velocity')
