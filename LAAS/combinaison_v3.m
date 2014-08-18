function C=combinaison_v3(nbre_ressorts,nbre_galets,deflec_max_sortie,pourcentage,c,deflec_max_ressort,K,y0,r,R)

w=pi/360;    
essai=floor(pourcentage*deflec_max_sortie/w)
theta=asin(c*essai*w/(R-r))
b=pourcentage*deflec_max_ressort;
X=(r*sin(theta));
paf=y0+(R-r)*((1/(cos(theta)))-1);



    
i=1;
for phi=0:w:deflec_max_sortie;
   
    alpha(i)=asin(c*phi/(R-r));
    
    if alpha(i)<theta
        
        Fr(i)=(nbre_ressorts/nbre_galets)*(c*phi*tan(theta)+y0)*K;
        y(i)=c*phi*tan(theta);
        tau(i)=nbre_galets*c*Fr(i)*tan(theta)/1000;
        phi_0=y0/(c*tan(theta+X));
        S(i)=(tau(i)-tau(1))/(phi);
        E(i)=tau(i)*phi/2;
        zero(i)=0;
     %tracé du profil de came--------------------------------------
        prof_came(i)=c*phi*tan(theta)-r*((1/(cos(theta)))-1);
       
     clac=i;
     else
        Fr(i)=((nbre_ressorts/nbre_galets)*K*((R-r)*(1-cos(alpha(i)))+paf));
        y(i)=(R-r)*(1-cos(alpha(i)))+paf-y0;
        tau(i)=nbre_galets*c*Fr(i)*(tan(alpha(i)))/1000;
        S(i)=(tau(i)-tau(i-1))/(w);
        E(i)=E(i-1)+tau(i)*w;
     
     %tracé du profil de came--------------------------------------
        alpha_prof(i)=asin(c*phi/(R));
        %prof_came(i)=(R)*(1-cos(alpha_prof(i)))+2*r*((1/(cos(theta)))-1); 
        %prof_came(i)=(R)*(1-cos(alpha_prof(i)))-2*prof_came(1);
        prof_came(i)=(R)*(1-cos(alpha_prof(i)))+prof_came(clac)-r*((1/(cos(theta)))-1); 
    end
    
i=i+1;
end



phi=0:w:deflec_max_sortie;
s=phi*180/pi;

C=[s;Fr;y;tau;S;E;alpha;prof_came];

