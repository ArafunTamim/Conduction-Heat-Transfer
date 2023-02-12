%%%Solving ODE - Resistance against radial conduction in a cylinder (BCs not specified)
%%%Author: Dr. Hamidreza Najafi, Florida Institute of Technology
%%% 1/26/2023

clc
clear

syms T(r)                   %Defining symbolic variables T and r
ode=diff(r*diff(T,r))==0; %Defining ODE
TSol(r)=dsolve (ode);       %Solving ODE
pretty(TSol)                %Make it look pretty :)