%%%Solving ODE - Resistance against radial conduction in a cylinder (BCs are specified)
%%%Author: Dr. Hamidreza Najafi, Florida Institute of Technology
%%% 1/26/2023

clc
clear
syms T(r)                    %Defining symbolic variables T and r
syms rin  rout TH TC r k L    %Defining symbolic variables for BCs

ode=diff(r*diff(T,r))==0;  %Defining ODE
cond1 = T(rin) == TH;        %BC1
cond2 = T(rout) == TC;       %BC2
conds = [cond1 cond2];       %BCs

TSol(r)=dsolve (ode,conds);  %Solving ODE
TSol=simplify(TSol) ;        

pretty(TSol)                %Make it look pretty :)

%Now let's find R:
Ts=TSol(r);                 
q=-k*2*pi*r*L*diff(Ts,r);   %Subs Ts in the Fourier's law for the cylinder 
pretty(simplify(q))        

R_cyl=(TH - TC)/q ;            %find Rcyl
pretty(simplify(R_cyl))        