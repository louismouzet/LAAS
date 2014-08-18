clear all
close all
clc
%---------------------------------------------------------------------
% plus la variation de précharge est étendue, plus la différence est
% importante entre les courbes

% essayer de ne pas dépasser une raideur de 1500-2000 Nm/rad



deflec_max_sortie=pi/6; %deflexion maxi de la sortie en rad
deflec_max_ressort=8; %deflexion max possible du ressort moins y0;
phi_initial=0;
r=9.5; %rayon du galet
c=27; %rayon de la came
R=28; %rayon de l'encoche, doit etre supérieur à c*deflec_max_sortie
K=22.41; %constante de raideur des ressorts en N/mm
y0_max=35; %précharge  des ressorts en mm
nbre_ressorts=4;
nbre_galets=3;

mu=0.005; %coefficient de frottement du galet ( entre 0.001 et 0.007)
w=pi/360;
%theta=atan(deflec_max_ressort/(c*deflec_max_sortie))
    
pourcentage=1/5;

y0=0;    
A1=pente_lineaire (nbre_ressorts,nbre_galets,deflec_max_sortie,c,deflec_max_ressort,K,y0,r,mu,phi_initial);
B1=pente_circulaire (nbre_ressorts,nbre_galets,deflec_max_sortie,c,deflec_max_ressort,K,y0,r,R,mu,phi_initial);
C1=combinaison_v3(nbre_ressorts,nbre_galets,deflec_max_sortie,pourcentage,c,deflec_max_ressort,K,y0,r,R,mu)
y0=y0_max/2;
A2=pente_lineaire (nbre_ressorts,nbre_galets,deflec_max_sortie,c,deflec_max_ressort,K,y0,r,mu,phi_initial);
B2=pente_circulaire (nbre_ressorts,nbre_galets,deflec_max_sortie,c,deflec_max_ressort,K,y0,r,R,mu,phi_initial);
C2=combinaison_v3(nbre_ressorts,nbre_galets,deflec_max_sortie,pourcentage,c,deflec_max_ressort,K,y0,r,R,mu)
%C3=combinaison_v3(nbre_ressorts,nbre_galets,deflec_max_sortie,pourcentage,c,deflec_max_ressort,K,y0,r,R,mu)
y0=y0_max;
A3=pente_lineaire (nbre_ressorts,nbre_galets,deflec_max_sortie,c,deflec_max_ressort,K,y0,r,mu,phi_initial);
B3=pente_circulaire (nbre_ressorts,nbre_galets,deflec_max_sortie,c,deflec_max_ressort,K,y0,r,R,mu,phi_initial);
C3=combinaison_v3(nbre_ressorts,nbre_galets,deflec_max_sortie,pourcentage,c,deflec_max_ressort,K,y0,r,R,mu)
D=profilsdecame(nbre_ressorts,nbre_galets,deflec_max_sortie,pourcentage,c,deflec_max_ressort,K,y0,r,R,mu);

%profils de came
A_profil_de_came=pente_lineaire (nbre_ressorts,nbre_galets,deflec_max_sortie,c,deflec_max_ressort,K,y0,r,mu,0.2);
B_profil_de_came=pente_circulaire(nbre_ressorts,nbre_galets,1.5*deflec_max_sortie,c,deflec_max_ressort,K,y0,r,R,mu,phi_initial);
C_profil_de_came=combinaison_v3(nbre_ressorts,nbre_galets,1.5*deflec_max_sortie,pourcentage,c,deflec_max_ressort,K,y0,r,R,mu)


% figure (1),clf
%     grid on, hold on
%     plot(A1(1,:),A1(4,:))
%     plot(B1(1,:),B1(4,:),'g')
%     plot(C1(1,:),C1(4,:),'r')
%     plot(A2(1,:),A2(4,:),:)
%     plot(B2(1,:),B2(4,:),'g:')
%     plot(C2(1,:),C2(4,:),'r:')
%     plot(A3(1,:),A3(4,:))
%     plot(B3(1,:),B3(4,:),'g')
%     plot(C3(1,:),C3(4,:),'r')
% xlabel('déflection en °');
% ylabel('N.m');
% title('Couple résistif');
% legend('pente lineaire,y0=0','pente circulaire,y0=0', 'combinaison,y0=0','pente lineaire,y0=1/2*y0_max','pente circulaire,y0=1/2*y0_max','combinaison,y0=1/2*y0_max','pente lineaire,y0=y0_max','pente circulaire,y0=y0_max','combinaison,y0=y0_max','location','North')
% hold off


figure (1),clf
    grid on, hold on  
    plot(B1(1,:),B1(4,:),'g')  
    plot(B2(1,:),B2(4,:))
    plot(B3(1,:),B3(4,:),'r')
xlabel('déflection de la sortie en °');
ylabel('N.m');
title('Couple résistif');
legend('précharge=0','précharge=1/2', 'précharge maxi','Location','North')
hold off


% figure (2),clf
%     grid on, hold on
%     plot(A1(1,:),A1(3,:))
%     plot(B1(1,:),B1(3,:),'g')
%     plot(C1(1,:),C1(3,:),'r')
%     plot(A2(1,:),A2(3,:),:)
%     plot(B2(1,:),B2(3,:),'g:')
%     plot(C2(1,:),C2(3,:),'r:')
%     plot(A3(1,:),A3(3,:))
%     plot(B3(1,:),B3(3,:),'g')
%     plot(C3(1,:),C3(3,:),'r')
% xlabel('déflection en °');
% ylabel('mm');
% title('deflection ressort en mm');
% hold off

figure (2),clf
    grid on, hold on
    plot(B1(1,:),B1(3,:),'g')
    plot(B2(1,:),B2(3,:))
    plot(B3(1,:),B3(3,:),'r')
xlabel('déflection en °');
ylabel('mm');
title('deflection ressort en mm');
legend('précharge=0','précharge=1/2', 'précharge maxi','Location','North')
hold off

% figure (3),clf
%     grid on, hold on
%     plot(A1(1,:),A1(5,:))
%     plot(B1(1,:),B1(5,:),'g')
%     plot(C1(1,:),C1(5,:),'r')
%     plot(A2(1,:),A2(5,:),:)
%     plot(B2(1,:),B2(5,:),'g:')
%     plot(C2(1,:),C2(5,:),'r:')
%     plot(A3(1,:),A3(5,:))
%     plot(B3(1,:),B3(5,:),'g')
%     plot(C3(1,:),C3(5,:),'r')
% xlabel('déflection en °');
% ylabel('Nm/rad');
% title('Raideur angulaire');
% hold off
% 

figure (3),clf
    grid on, hold on
    plot(B1(1,:),B1(5,:),'g')
    plot(B2(1,:),B2(5,:))
    plot(B3(1,:),B3(5,:),'r')
xlabel('déflection en °');
ylabel('Nm/rad');
title('Raideur apparente');
legend('précharge=0','précharge=1/2', 'précharge maxi','Location','North')
hold off


% figure (4),clf
%     grid on, hold on
%     plot(A1(1,:),A1(6,:))
%     plot(B1(1,:),B1(6,:),'g')
%     plot(C1(1,:),C1(6,:),'r')
%     plot(A2(1,:),A2(6,:),:)
%     plot(B2(1,:),B2(6,:),'g:')
%     plot(C2(1,:),C2(6,:),'r:')
%     plot(A3(1,:),A3(6,:))
%     plot(B3(1,:),B3(6,:),'g')
%     plot(C3(1,:),C3(6,:),'r')
% xlabel('déflection en °');
% ylabel('J');
% title('Energie stockée');
% hold off

figure (4),clf
    grid on, hold on
    plot(B1(1,:),B1(6,:),'g')
    plot(B2(1,:),B2(6,:))
    plot(B3(1,:),B3(6,:),'r')
xlabel('déflection en °');
ylabel('J');
title('Energie stockée');
legend('précharge=0','précharge=1/2', 'précharge maxi','Location','North')
hold off

omega=0:w:(2*pi);

figure (5),clf
    grid on, hold on
    plot(2*c*w*B1(1,:),B1(7,:)/(2*w),'g')
    plot(2*c*w*B2(1,:),B2(7,:)/(2*w))
    plot(2*c*w*B3(1,:),B3(7,:)/(2*w),'r')
xlabel('distance c*phi en mm');
ylabel('°');
title('alpha');

legend('précharge=0','précharge=1/2', 'précharge maxi','Location','North')
hold off

omega=0:w:(2*pi);


% figure (),clf
%     grid on, hold on
%     %pente circulaire------------------
% plot((c*2*w)*B_profil_de_came(1,:),B_profil_de_came(8,:),'g')
% plot(r*cos(omega)+c*deflec_max_sortie,r*sin(omega)+B2(3,size(B2,2))+r,'g:')
% %pente lineaire----------------------
% 
% plot((c*2*w)*A_profil_de_came(1,:),A_profil_de_came(8,:),'b')
% % plot((c*2*w)*A2(1,:),A2(8,:),'b')
% plot(r*cos(omega)+c*deflec_max_sortie,r*sin(omega)+A2(3,size(A2,2))+r,'b:')
% %combinaison------------------------------
% plot((c*2*w)*C_profil_de_came(1,:),C_profil_de_came(8,:),'r')
% plot(r*cos(omega)+c*deflec_max_sortie,r*sin(omega)+C3(3,size(C3,2))+r,'r:')
% %plot((c*2*w)*C3(1,:),C3(3,:),'k')
% %galet en position initiale--------------
% plot(r*cos(omega),r*sin(omega)+r,'k:')
% hold off

figure (),clf
    grid on, hold on
    
%galet en position initiale--------------
plot(r*cos(omega),r*sin(omega)+r,'k:')
%pente circulaire------------------
plot((c*2*w)*B_profil_de_came(1,:),B_profil_de_came(8,:),'r')
plot(r*cos(omega)+c*deflec_max_sortie,r*sin(omega)+B2(3,size(B2,2))+r,'r:')
xlabel('x');
ylabel('y');
title('1 demi-profil de came avec galet');
legend('galet en position iniitiale','profil de came','galet en position finale','Location','North')
hold off