## Script Description
This script receives raw experimental data of combustion chamber pressure signal from an in-cylinder piezoelectric sensor on a 2-stroke engine and finds misfire events.
According to the user-selected pressure limit "Pres_limit" for the expansion phase (downward movement of the piston), every crank-cycle without combustion is identified.

Then, the motivo of how many consecutive combustions are happening before every misfire is identified and presented in a normalized histogram. 
Finally the average number of consecutive combustions and it's standart deviation are calculated.
