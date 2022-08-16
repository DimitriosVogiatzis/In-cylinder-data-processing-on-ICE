%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Patern identification of misfire %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Dimitrios Vogiatzis,  TU GRAZ %%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc; 
load Combustion_Data ;                                  %% Load the data from .mat file
Pressure_signal = data1.Pressure_signal.data ;          %% Pressure signal of Combustion Chamber or other signal

%% Create a Matrix with 1 = Combustion and 0 = Misfire
% If piezoelectric signal is less than -20 means that we have no combustion & no work produced at the given cycle
for i=1:length(Pressure_signal)
    if Pressure_signal(i)>=-20
        Combustion(i)= 1;
    else
        Combustion(i)= 0;
    end
end

plot(-Pressure_signal);
hold on
plot(Combustion);

%% Initialization matrixes

CCC  = 0;                                   %% Count consecutive Combustions;
pattern_size = 60;                          %% 40 consecutive combuistions is the maximum resolution of patern identification
Motivo = [];                                %% Motivo of consecutive combustion until the misfire happens eg 10:1, 15:1 with maximum 60:1 

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

%% Histogram creation
figure()
plot(Motivo,'*'); 
Mean_duration = mean(Motivo);
Standart_deviation = std(Motivo);
histogram(Motivo,'Normalization','probability');
            
            
        
    
