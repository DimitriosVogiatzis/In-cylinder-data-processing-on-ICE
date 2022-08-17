## Script Description
This script receives raw testbench measurement data for an in-cylinder gasoline engine of:
1. time [s]
2. pressure signal [V]
3. crank-angle position [V] and TDC [V] 
4. ignition advance timing [V] 

from:

1. an in-cylinder piezoelectric pressure sensor,
2. an encoder position sensor for identifying the TDC and the crank angle position,
3. an amprerometer for detecting the ignition activation.

Then, the data is processed and synchronized with each other in order to produce the useful information.
Finally the P-θ, P-V, P-V(log), P-V(only for compression), P-V(only for expansion), Wiebe progression-θ, dQ/dθ-θ(2nd order MA) dQ/dθ-θ and ΣQ-θ are created.
Also, the indicated efficiency, real brake efficiency and mechanical efficiency are calculated.

![untitled](https://user-images.githubusercontent.com/65401171/185080053-b40913b1-271b-4861-9ec8-22129f74491e.jpg)
![untitled2](https://user-images.githubusercontent.com/65401171/185080081-d9613423-ed72-4ddc-92aa-c00d06e05fcd.jpg)
![untitled3](https://user-images.githubusercontent.com/65401171/185081291-50b1aade-aa5c-45c9-9c0a-1b3a922f8ad2.jpg)

## How to use
1. Load your raw measurement data to a matlab stuck or excel file at the same folder or use the default.
2. Open the Cacluations_Indicator.m and read your data use the default.
3. Set your measuement point (Torque or T, Speed or N)
4. Run the Cacluations_Indicator.m
5. Run the PLotter_Indicator.m

## Contributors:
[Dimitrios Vogiatzis]

## References 
This is a utility tool created for my Diploma degree at Aristotle University of Thessaloniki, school of Mechanical Engineering, Laboratory of Thermodynamics and Internal Combustion Engines.

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
