%%%%%%%%%%%%% Dimitrios Vogiatzis, ICE Laboratory, AUTH %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Indicator diagram production - AUTH 2017-2018 %%%%%%%%%%%%%%
%%%%%% DATA ANALYSIS AND DIAGRAM PRODUCTION OF AN INDICATOR DIAGRAM %%%%%%%

%% Pressure Plotter 
A=axis;
createfigure2(P,[1 1],[50*A(3) 50*A(4)],[150 150],[150+180 150+180],[150+360 150+360],[150+180+360 150+180+360],[720-195 720-195],[302 302],[302+195 302+195]);
    
figure;
    plot(V,P,'LineWidth',1.5);
    title('P-V diagram')
    xlabel('Volume [m^3]');
    ylabel('Pressure [Bar]');

    figure;
    plot(log(V),log(P),'LineWidth',1.5);
    title('P-V(log) diagram')
    xlabel('Volume');
    ylabel('Pressure');

    figure;
    A=log(V(1:150));
    B=log(P(1:150));
    plot(A,B,'LineWidth',1.5);
    title('P-V(log) diagram only for compression')
    xlabel('Volume [m^3]');
    ylabel('Pressure [Bar]');

createfigure(A,B);
    figure;
    A=log(V(175:(150+180-38)));
    B=log(P(175:(150+180-38)));
    plot(A,B,'LineWidth',1.5);
    title('P-V(log) diagram only for expansion')
    xlabel('Volume [m^3]');
    ylabel('Pressure [Bar]');

%% Combustion plotter
    figure;
    A=axis;
    createfigure3(dQ_dtheta,[1 1],[50*A(3) 50*A(4)],[150 150],[150+180 150+180],[150+360 150+360],[150+180+360 150+180+360],[720-195 720-195],[302 302],[302+195 302+195]);
    figure;
    createfigure4(dQ_dtheta_s,[1 1],[50*A(3) 50*A(4)],[150 150],[150+180 150+180],[150+360 150+360],[150+180+360 150+180+360],[720-195 720-195],[302 302],[302+195 302+195]);
    figure;
    plot(Q_sum,'LineWidth',1.5);
    title('sum of Q - degrees')
    xlabel('degrees');
    ylabel('Sum of Q [J/deg]');

    figure;
    plot1=plot(x_b,'LineWidth',1.5);
    title({'Wiebe approach'});
    xlabel({'degrees of duration'});
    hold all
    plot2=plot(x);
    legend('x real','x Wiebe');
    set(legend,...
        'Position',[0.68154762138923 0.195634922905574 0.169642854801246 0.0869047596341088]);
    hold off
