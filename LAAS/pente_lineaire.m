function A=pente_lineaire (nbre_ressorts,nbre_galets,deflec_max_sortie,c,deflec_max_ressort,K,y0,r,phi_initial)

w=pi/360;
theta=atan(deflec_max_ressort/(c*deflec_max_sortie))
    
    
i=1;
for phi=phi_initial:w:deflec_max_sortie;
   
Fr(i)=(nbre_ressorts/nbre_galets)*(c*phi*tan(theta)+y0)*K;
y(i)=c*phi*tan(theta);
% tau_fr(i)=nbre_galets*c*Fr(i)*((tan(theta))(sin(theta)))+mu*((cos(theta))^2))/1000;
tau(i)=nbre_galets*c*Fr(i)*tan(theta)/1000;
phi_0=y0/(c*tan(theta));
S(i)=(tau(i)-tau(1))/(phi-phi_initial);
E(i)=tau(i)*phi/2;
zero(i)=0;
prof_came(i)=c*phi*tan(theta)-r*((1/(cos(theta)))-1);

i=i+1;
end



phi=phi_initial:w:deflec_max_sortie;
s=phi*180/pi;

A=[s;Fr;y;tau;S;E;zero;prof_came];
