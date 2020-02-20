# ANALYSIS SCRIPTS 
Paper Title: Humans Use Forward Thinking to Exert Social Control

I. SYSTEM REQUIREMENTS AND INSTALLATION GUIDE

Verify that version 9.5 (R2018b) of the MATLAB Runtime is installed.   
If not, you can run the MATLAB Runtime installer.
To find its location, enter
  
    >>mcrinstaller
      
at the MATLAB prompt.
NOTE: You will need administrator rights to run the MATLAB Runtime installer. 

Alternatively, download and install the Windows version of the MATLAB Runtime for R2018b 
from the following link on the MathWorks website:

    http://www.mathworks.com/products/compiler/mcr/index.html
   
For more information about the MATLAB Runtime and the MATLAB Runtime installer, see 
"Distribute Applications" in the MATLAB Compiler documentation  
in the MathWorks Documentation Center.


II. REPRODUCTION INSTRUCTIONS

1)Behavioral results	

	1.1. open run.m ("run.m" is at https://github.com/SoojungNa/ug2_analysis_scripts/1.beh)
	
	1.2. update input/output directories (line 17, 23)
		- Input data("beh02_clean.mat") is at https://github.com/SoojungNa/ug2_analysis_scripts/0.data

	1.3. run run.m

	1.4. "results.mat" will be generated. This file has the variables as below.
		"ID" - participants' ids
		"Mname"
			- Eight strings represents the labels for each pair of the columns of "M"
			- 'offer': Mean offer throughout 40 trials
			- 'rejR': Mean rejection rate
			- 'rejR_L': Mean rejection rate for low offers ($1-3)
			- 'rejR_M': Mean rejection rate for medium offers ($4-6)
			- 'rejR_H': Mean rejection rate for high offers ($7-9)
			- 'reward': Mean reward
			- 'emo': Mean self-reported emotion ratings
			- 'pc': Self-reported perceived control ratings
		"M"
			- Odd columns are the "In Control" condition.
			- Even columns are the "No Control" condition.
			- The labels for each pair of the columns are in "Mname".
			- Each row matches with each participant in the same order as in "ID".
		"M_mean"
			- Mean of "M" across the participants
		"M_std"
			- Standard deviation for "M" across the participants
		"stat_ICvNC"
			- 'columns': column labels for 'f_var', 'pt_mean', 't_mean_uneqvar'
			- 'rows': row labels for 'f_var', 'pt_mean', 't_mean_uneqvar'			
			- 'f_var': Results of F-test for variance difference between IC and NC
			- 'pt_mean': Results of t-test for mean difference assuming equal variance between IC and NC
			- 't_mean_uneqvar': Results of t-test for mean difference assuming unequal variance between IC and NC

2)Modeling results

	1.1. a
	

3)Whole brain results

4)ROI results

