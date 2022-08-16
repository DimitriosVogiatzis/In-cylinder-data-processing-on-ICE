%%%%%%%%%%%%% Dimitrios Vogiatzis, ICE Laboratory, AUTH %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Indicator diagram production - AUTH 2017-2018 %%%%%%%%%%%%%%
%%%%%% DATA ANALYSIS AND DIAGRAM PRODUCTION OF AN INDICATOR DIAGRAM %%%%%%%
clear figure;
clear all; clc;
format long

%% Read the data from excel
    dat = xlsread('1200rpm_87Nm.xlsx');
    T=87;                                       %[Nm]
    N=1200/60;                                  %[1/sec]
    time = dat(:,1);
    P_Volt = dat(:,2);
    Crank_Volt = dat(:,3);
    TDC_Volt = dat(:,4);
    Advance_Volt = dat(:,5);

%% Find the spacing between 2 TDC (720 degrees)
    a=1;
    for i=1:length(TDC_Volt)
         if TDC_Volt(i)>=3.5 && a==3
            TDC_720=i;
            time_TDC_720 = time(i);
         end
        if TDC_Volt(i)>=3.5 && a==2
            a=3;
            TDC_360=i;
            time_TDC_360 = time(i);
        end
        if TDC_Volt(i)>=3.5 && a==1
            a=2;
            TDC_0=i;
            time_TDC_0 = time(i);
        end
    end

%% Convertion of time to degrees 
    Crank=[];
    a=1;
    t=1;
    Advance_V=zeros(720,1);
    P1=zeros(720,1);
    for i=TDC_0:TDC_720
        if Crank_Volt(i+1)>0 && Crank_Volt(i)<0
            P1(a)=P_Volt(i)*10;
            Advance_V(a)=Advance_Volt(i);
            a=a+1;
        end 
        if Advance_Volt(i)<3.6 && t==1
            fs=a;
            t=2;
        end
    end
    fs=150-(720-fs); % start of ignition
% Pressure table creation
    disp= 0.8-P1(570);
% START FROM THE IVC ALL THE DIAGRAMS
    Advance_Vo=[Advance_V(570:720); Advance_V(1:569)];
    P= disp+[P1(570:720); P1(1:569)];

%% Volume Creation
    l=123.29*0.001;
    s_all=74.3*0.001;
    R=2*l/s_all;
    Vdall=1392*10^(-6);
    r=77.24/2*0.001;
    e=9.3;
    Acyl=pi*(r)^2;
    %
    for i=1:720
        s(i,1)=r+l-sqrt(l^2-r^2*(sin(degtorad(i)))^2)-r*cos(degtorad(i));
        ds_dtheta(i,1)=r*(sin(degtorad(i))+r/(l*2)*sin(2*degtorad(i))/sqrt(1-(r/l)^2*sin(degtorad(i))^2));
        dV_dtheta1(i,1)=Acyl*ds_dtheta(i);
    end
    Vd=Acyl*s_all;
    Vc=Vd/(e-1);
    for i=1:720
        V1(i,1)=Vc+s(i)*Acyl;
    end
% START FROM IVC
    V= [V1(570:720); V1(1:569)];
    dV_dtheta= [dV_dtheta1(570:720); dV_dtheta1(1:569)];

%% Polytropic n
    n_comp= log(P(106)/P(105))/log(V(105)/V(106));
    n_exp = log(P(201)/P(200))/log(V(200)/V(201));

%% Work
    Wi=4*sum(100000*P.*(dV_dtheta*deg2rad(1))); % Indicative Work
    Wb=4*pi*T; % Real Work

%% Meps
    Imep=4*Wi/(Vd*N);
    Bmep=Wb/Vd;
    Fmep=Imep-Bmep;

%% Combustion
    gamma=1.30;

%% dP_dtheta
    for i=1:719
        dP_dtheta(i,1)=100000*(P(i+1)-P(i))/1;
    end
    dP_dtheta(720,1)=100000*(P(1)-P(720))/1;

%% dQ_dtheta
    a=0;
    for i=1:720
        %dQ_dtheta(i)=100000*P(i)*dV_dtheta(i)*deg2rad(1)+1/(gamma-1)*(100000*P(i)*dV_dtheta(i)+V(i)*dP_dtheta(i))*deg2rad(1);
        dQ_dtheta(i)=100000*P(i)*dV_dtheta(i)*deg2rad(1)*gamma/(gamma-1)+V(i)*dP_dtheta(i)*1/(gamma-1);
    end
        dQ_dtheta_s=smooth(dQ_dtheta,'moving');
    for i=1:719
        if i>=200 && dQ_dtheta_s(i)<0 && a==0
            fd=i-fs;
            a=1;
        end
    end

%% Sum of Q
    Q_sum(1)=0;
    t=1;
    for i=fs:fs+fd
        Q_sum(t+1)= Q_sum(t)+dQ_dtheta_s(i);
        t=t+1;
    end
    Qin=4*Q_sum(end);

%% x_b
    a=9.; % a vibe
    n=1.5; % n vibe % oso megalwnei metatopizei ston x pros ta dexia
    t=1;
    for i=fs:fs+fd
        x_b(t)=Q_sum(t)/Q_sum(end);
        x(t)=1-exp(-a*((i-fs)/fd)^n);
        t=t+1;
    end

%% Efficiency Rates
    h_i=Wi/Qin;
    h_b=Wb/Qin;
    h_m=Wb/Wi;
