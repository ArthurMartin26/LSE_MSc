**OBSOLETE** **NO LONGER IN USE** 


# LSE_MSc - do this all for Ghana, then if we can replicate for other countries then great.
This is my MSc coding repo, it will be mainly used for my dissertation but also may include some problem set code 
Updates- working changes, we have selected a set of SSA nations for which we have DHS files for as well as geospatial data. In the geospatial data we have nightlight data available so I do not need to calculate these. 

I do need to perform a simple easy bit of code (see the following: A1) which transform the .shp data into .dta file which can be saved into output. this gps.dta file has the longitudinal and latitudinal values which we can use to 'merge' previous so t-1 to t dataset. in Ghana's example, this would allow us to compare cluster in 2014 to 2022. NOTE: we are aggregating and averaging MPI, Empowerment scores across regions and then we are linking thier data over time, so are examining within cluster changes in economic activity. 

**Next stages:**

1) [BIG /HARD ] Create empowerment index - find varaibles (avaialable in both early 2010s and 2020s dataframes (df's)) we can use to create this index, create the index for women and then link it to the mpi results through ind_id merge on the mpi outputted pov.dta data
2) [MEDIUM ] Aggregate and average MPI as well as empowerment metrics for each cluster, propably perform a group by function for this. This gives us indentification level MPI, empowerment metrics.
   
4) [SMALL] Merge night light level data to cluster data based off v001 / culster id
   
4)**complete** [MED/HARD] link previous clusters to new clusters based off long and lat coordinates (use a nearest neighbour aproach probs 5/10 km) to create a psuedo panel. 

5) once panel is created perform econometric analysis!
   
7) [SMALL/MED] change file structure. make one folder per country - then a final output folder per country so when merging between countries it is not having to be save in the most recent country folde
8) **COMPLETE** [MED]create MPI for 2014 data ghana
   
 

#### A1 -example for ghana 22 gps.dta creation ####
global path_in "C:\Users\Arthur.Martin\OneDrive - Department of Health and Social Care\Documents\LSE\Diss\CODING\Ghana 2022\Ghana_StataDataset"
global path_out "C:\Users\Arthur.Martin\OneDrive - Department of Health and Social Care\Documents\LSE\Diss\CODING\Ghana 2022\Outputs"
** read in the shape data and save as a .dta file
spshape2dta "$path_in\GH_2022_DHS_GEOG\GHGE8AFL\GHGE8AFL.shp" , replace
use"GHGE8AFL.dta",clear
save "$path_out/Ghana22_gps.dta", replace
################################

**Concerns and aspects to focus on**
1) Clusters - are they representitive? if we are looking at average mpi and average empowerment is this really explantory?
2) Empowerment - are we happy with the idea of averaging the empowerment - should be careful and decide maybe take a median value as opposed to the mean value.

**Notes when making previous mpi files**
1) for age in months use : gen age_month_b = hv008 - hc32

2) hv243e - computer in new script / old script - sh110l
3) freezer new script - / freezer old script - sh110i

**Last update**
02.02 17;11 - made the MPI panel data from ghana, next need to link night lights, then create empowernemnt index and run the regression. Once we have for Ghana we can move onto other countries! 
03.02 - changes the file paths and structure to put the pipeline repo onto git but all of the data is in another folder so we do not have data on git only scripts 

