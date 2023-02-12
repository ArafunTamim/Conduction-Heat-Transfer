%%%Solving ODE - Resistance against radial conduction in a sphere (BCs are specified)
%%%Author: Dr. Hamidreza Najafi, Florida Institute of Technology
%%% 1/26/2023

clc
clear
syms T(r)                    %Defining symbolic variables T and r
syms rin  rout TH TC  k      %Defining symbolic variables for BCs

ode=diff(r^2*diff(T,r))==0;  %Defining ODE

cond1 = T(rin) == TH;        %BC1
cond2 = T(rout) == TC;       %BC2
conds = [cond1 cond2];       %BCs

TSol(r)=dsolve (ode,conds);  %Solving ODE
TSol=simplify(TSol) ;        %Make it look pretty :)

pretty(TSol)

%Now let's find R:
Ts=TSol(r);                 
q=-k*4*pi*r^2*diff(Ts,r);   %Subs Ts in the Fourier's law for the sphere 
pretty(q)        

R_sph=(TH-TC)/q ;            %find Rsph
pretty(R_sph)        

