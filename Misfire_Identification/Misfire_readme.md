## Script Description
This script receives raw experimental data of pressure signal from an in-cylinder pressure sensor on a 2-stroke engine and finds misfire events.
According to the user-selected pressure limit "Pres_limit" for not-combustible expansion phase (while at downward movement of the piston), every crank-cycle without combustion is identified.
![untitled](https://user-images.githubusercontent.com/65401171/185071320-dc2e26b1-73e4-4ad9-a6bf-28a003e87f79.jpg)
![untitled2](https://user-images.githubusercontent.com/65401171/185071425-a4393ba0-b9ca-4ed4-b0a4-efb217e25dd2.jpg)

Then, the motivo of consecutive combustions before each and every misfire is identified and presented in a normalized histogram. 
Finally the average number of consecutive combustions and it's standart deviation are calculated.

## How to use
1. Load your pressure signal data to a matlab stuck at the same folder or use the default.
2. Open the Pattern_misfire.m and set your pressure limit or use the default.
3. Run the Pattern_misfire.m
4. PLotting 

## Contributors:
[Dimitrios Vogiatzis]

## References 
This is a utility tool created for my PhD research project at Technical University of Graz, Institute of Thermodynamics and Sustainable Propulsion Systems.

## Copyrights
[Creative Commons]
<br />
<br />
## License
[Creative Commons Licence]
<br />
<br />

>(C) 2022,Dimitrios Vogiatzis<br />
>jimmyvog@gmail.com

[//]: # "links"

[Creative Commons]: <https://creativecommons.org/licenses/by-nc-nd/4.0/>
[Creative Commons Licence]: <https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode>
[Dimitrios Vogiatzis]: <http://www.linkedin.com/in/dimitrios-vogiatzis95>
