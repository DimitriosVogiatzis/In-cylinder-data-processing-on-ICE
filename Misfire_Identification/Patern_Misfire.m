%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Patern identification of misfire %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Dimitrios Vogiatzis,  TU GRAZ %%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc; 

load Combustion_Data ;                                  % Load the data from .mat file
Pressure_signal = data1.Pressure_signal.data ;          % Pressure signal of Combustion Chamber

%% Create a Matrix with 1 = Combustion and 0 = Misfire
Pres_limit = -20;                                       % Combustion chamber pressure signal limit for misfire identification
% If pressure signal is less than Pres_limit means that we have no combustion & no work produced at the given cycle
for i=1:length(Pressure_signal)
    if Pressure_signal(i)>=-20
        Combustion(i)= 1;
    else
        Combustion(i)= 0;
    end
end

%% Initialization matrixes

CCC  = 0;                                               % Count consecutive Combustions;
pattern_size = 60;                                      % 40 consecutive combuistions is the maximum resolution of patern identification
Motivo = [];                                            % Motivo of consecutive combustion until the misfire happens eg 10:1, 15:1 with maximum 60:1 

%% Solver
i=1;
j=pattern_size;

    while i<=(length(Combustion)-j) 
            if Combustion(i)==1 
                CCC = CCC+1;    
            else   
               Motivo = [Motivo ; CCC ] ;
               CCC=0;
            end    
    i=i+1  ;
    end

%% Plots creation
figure()
plot(Pressure_signal);
hold on
plot(Combustion);
title('Misifre identification from Pressure signal')
ylabel('Pressure signal [bar], Misfire [0/1]')
xlabel('number of signals (-)')
legend('Pressure signal [bar]','Misfire [0/1]')

figure()
plot(Motivo,'*');
title('Number of consecutive combustions before misfire for each motivo')
xlabel('motivos (-)')
ylabel('number of consecutive combustions (-)')

Mean_ConsecComb = mean(Motivo)
Standart_deviation = std(Motivo)

figure()
histogram(Motivo,'Normalization','probability');
title('Probability histogram of consecutive combustions')
xlabel('number of consecutive combstions before misfire (-)')
ylabel('Probability of consecutive combustions (-)')
            
            
        
