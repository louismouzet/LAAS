function B=pente_circulaire (nbre_ressorts,nbre_galets,deflec_max_sortie,c,deflec_max_ressort,K,y0,r,R,phi_initial)

w=pi/360;     
i=1;
for phi=phi_initial:w:deflec_max_sortie;
   
    
alpha(i)=asin(c*phi/(R-r));
Fr(i)=((nbre_ressorts/nbre_galets)*K*((R-r)*(1-cos(alpha(i)))+y0));
y(i)=(R-r)*(1-cos(alpha(i)));
frott(i)=Fr(i)*cos(alpha(i));
tau(i)=nbre_galets*c*Fr(i)*(tan(alpha(i)))/1000;
S1(i)=0;
E(i)=0;
%tracé du profil de came----------------------------
alpha_profil(i)=asin(c*phi/(R));
prof_came(i)=(R)*(1-cos(alpha_profil(i)));  

i=i+1;
end



phi=phi_initial:w:deflec_max_sortie;
s=phi*180/pi;

B=[s;Fr;y;tau;S1;E;alpha;prof_came];


j=2;
for phi=phi_initial+w:w:(deflec_max_sortie);
    
    
    B(5,j)=(B(4,j)-B(4,j-1))/(w);
    B(6,j)=B(6,j-1)+B(4,j)*w;
    j=j+1;
end

B(5,1)=B(5,2);
B(6,1)=B(6,2);