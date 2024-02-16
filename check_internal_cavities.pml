## Check a protein for internal cavities ##
# This example identifies an internal pocket created by the T4 lysozyme L99A substitution
# by comparing the wild type structure (pdb code: 1l63) and the L99A variant (pdb code: 1l90). 
# Eriksson, A. E., Baase, W. A., Zhang, X. J., Heinz, D. W., Blaber, M., Baldwin, E. P.,
# & Matthews, B. W. (1992). Response of a protein structure to cavity-creating mutations
# and its relation to the hydrophobic effect. Science, 255, 178–183.
# https://doi.org/10.1126/science.1553543

# Instructions: 
# open PyMOL
# drag this file onto the PyMOL viewing window

# clear any PyMOL settings and set working directory
reinitialize
cd ~/Desktop

# download the wild-type (1l63) and Leu99Ala (1l90) structures from the protein data bank
# both proteins also contain the Cys54Thr/Cys97Ala substitutions to remove a disulfide 
# crosslink. The stability and activity of this cysteine-free mutant is essentially
# identical with the wild-type enzyme.
# async = 0 requires the download to finish before going to the next command
# when modifying this script to load files from the working directory, use 
# 'load 1l63.pdb, WT' in place of fetch command below

fetch 1l63, type = pdb, name = 'WT', async = 0
fetch 1l90, type = pdb, name = 'Leu99Ala', async = 0

# remove water molecules for clarity
# show side chains as sticks colored by atom
# use green carbons for wild-type structure
# use blue carbons for Leu99Ala structure
remove resn HOH
set cartoon_side_chain_helper, on
show sticks, all
util.cbag WT
util.cbab Leu99Ala

# display surface of pockets and cavities only
set surface_cavity_mode, 1

# set transparency of surface to 40% and color to yellow
set transparency, 0.4
set surface_color, yellow
show surface

# show position 99 as orange sticks
util.cbao resi 99

# use the zoom command below to zoom in on residue 129 with a 10 Å radius zoom
# this command will place residue 129 in the center, but the view may not be best
# zoom resi 99, 10

# to get a better view, adjust the view manually, then type 'get_view'
# this command will return a set_view command like the one you see below, 
# but with different numbers. Replace the command below with the one returned
# by PyMOL to automatically go to that view.

# adjust to zoom in and orient view to position 99 and the associated cavity
set_view (\
     0.280132115,   -0.950214684,   -0.136434376,\
     0.416004360,   -0.007920738,    0.909332395,\
    -0.865141094,   -0.311487436,    0.393072486,\
     0.000000000,    0.000000000,  -74.134986877,\
    30.149997711,    5.736000538,    5.680692673,\
    58.448589325,   89.821388245,  -20.000000000 )
        
# toggle visibility of WT and Leu99Ala to compare cavities
# note the close overlap of the two structures