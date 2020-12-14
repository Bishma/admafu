; My default ending gcode for use with my Prusa I3 MK3s

G4 ; wait for buffer to clear
M221 S100 ; reset flow
M900 K0 ; reset Linear Advance
M140 S0 ; turn off heatbed
M107 ; turn off fan
{if layer_z < max_print_height}G1 Z{z_offset+min(layer_z+30, max_print_height)}{endif} ; Move print head up 30mm or as close as possible
G1 X150 Y125 F4800; Position x and y as a compromised between how viewable the print and head are to camera vs. not unspooling extra filament
G1 E5 F700; Crank out some plastic to weigh down the plastic thread. This prevents material from curling up as it cools, sticking to hotend. 700mm/min
G1 E-2 F700; Retract a little. 700mm/min
{if print_settings_id=~/.*(DETAIL @MK3|QUALITY @MK3|@0.25 nozzle MK3).*/}M907 E538 ; reset extruder motor current{endif}
M104 S0 ; turn off temperature
M84 ; disable motors