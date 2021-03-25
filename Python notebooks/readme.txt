###############################
Txt files required by the codes
###############################

Characteristics_no_rep.txt

interp_scattered_Noisy_NearFieldData.txt

NearFieldData_4_reduced_newangle_rev20_dec.txt

NearFieldData_no_rep_4.txt

Noisy_NearFieldData.txt


#####################################
Notebooks files required by the codes
#####################################

NN_4_multiple_dec6_noise.ipynb

NN_4_multiple_dec6_main.ipynb

NN_4_multiple_dec6_conv.ipynb

NN_4_multiple_dec6_no_preproc.ipynb


#################################
Instructions to use the notebooks
#################################

Run "NN_4_multiple_dec6_noise.ipynb" to create noisy data from the scatter wave intensities. 

Run "NN_4_multiple_dec6_main.ipynb" to load in the noisy data, create the most accurate NN 
and fit the model on the interpolated and preprocessed data.

Run "NN_4_multiple_dec6_conv.ipynb" to load in the noisy data, create a convolutional NN
and fit the model on the interpolated and preprocessed data.

Run "NN_4_multiple_dec6_no_preproc.ipynb" to load in the noisy data, create the NN 
and fit the model on the non interpolated and non preprocessed data.




