/* This file is creating the panel data , linking the two dataframes as well as the night light data. 


*/ 


global path_panel_in "C:\Users\Arthur.Martin\OneDrive - Department of Health and Social Care\Documents\LSE\Diss\CODING\Ghana\Ghana_panel"
global path_panel_out "C:\Users\Arthur.Martin\OneDrive - Department of Health and Social Care\Documents\LSE\Diss\CODING\Ghana\Ghana_panel\panel_outputs"
global path_in22 "C:\Users\Arthur.Martin\OneDrive - Department of Health and Social Care\Documents\LSE\Diss\CODING\Ghana\Ghana 2022\Outputs"
global path_in14 "C:\Users\Arthur.Martin\OneDrive - Department of Health and Social Care\Documents\LSE\Diss\CODING\Ghana\Ghana 2014\Outputs"

use "$path_panel_out\Ghana_linked_clusters.dta" , clear


* Merge 2014 cluster MPI
merge 1:1 cluster14 using "$path_in14/GH14_cluster_MPI.dta", nogen keep(match)
rename (H_cluster MPI_cluster cbar_cluster) ///
       (H14       MPI14        cbar14)

	   
* Merge 2022
merge 1:1 cluster22 using "$path_in22/GH22_cluster_MPI.dta", keep(match) nogen
rename (H_cluster MPI_cluster cbar_cluster) (H22 MPI22 cbar22)

gen diff_mpi = (MPI14 - MPI22)*-1

* Sort and plot vertical bars
sort diff_mpi
graph bar diff_mpi, over(cluster22, sort(1) descending label(labsize(vsmall) angle(45))) ///
    bargap(0)  ///
    ytitle("ΔMPI (MPI22 - MPI14)") ///
    title("Change in MPI by Cluster (2014 → 2022)") ///
    name(g_diffMPI_v, replace)
	
	