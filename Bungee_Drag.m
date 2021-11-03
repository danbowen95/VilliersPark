% Bungee1
clc;
clear;
close all;

%% Inputs

% Time
dt = 0.05;     % Timestep (s)
Tmax = 10;      % Max time (s)
ninc = Tmax/dt; % Number of increments

% Jumper
m = 1;      % Mass of jumper (Kg)
xTop = 100; % Starting height
c = 0.5;       % Coeff of drag    % <--
rho = 1.225; % Density of air
A = 1;       % Area of diver
CdA = 0.5 * rho * c;            % <--

% Force
% force = 10;                   % <--

% Set up vars to store data
t = linspace(0,Tmax,ninc);
x = zeros(size(t));   % Displacement
v = zeros(size(t));   % Velocity
a = zeros(size(t));   % Acceleration
F = zeros(size(t));   % Total force on jumper

%% Set initial conditions   
x(1)  = xTop;                      % <--
v(1)  = 0;
F(1)  = m*9.81 - ( CdA * v(1)^2 );  
a(1)  = -F(1) / m;                 % <--


%% Loop thru and calc
for n = 2:ninc
    F(n)  = m*9.81 - ( CdA * v(n-1)^2 );  % <--
    a(n)  = -F(n) / m;                    % <--
    v(n)  = v(n-1) + (a(n)*dt);
    x(n)  = x(n-1) + (v(n)*dt);
end


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
