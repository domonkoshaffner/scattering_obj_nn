function g = interp_step_scattered_waves(M)

% Aim of this Matlab code: reducing oscillation of waves, simplifying their structure. 
% 
% Input: a matrix with the wave intensities in the rows.
% Output: a matrix of the same shape with transformed (simplified) wave intensity data in the rows.  
% 
% Main steps in the code for each wave-period:
%
% 1. Compute sites with maximal and minimal wave intensity.
% 2. Compute their average. 
% 3. Compute the site for the average (assumed to be the average of the minimum and maximum site).
% 4. Consider the average sites  -- averages data set.
% 5. Interpolate and extrapolate from here linearly.
% 6. Beginning and end of the waves should be cared separately to have accuracy everywhere.
% 7. One should care the cases without local minimum or maximum.

M=dlmread('Noisy_NearFieldData.txt');
si=size(M);
M_interp = [];

for k=1:si(1) % for each row of the input matrix
k
    w=M(k,:);
 w_orig = w; 
 
 
onw=ones(length(w),1);
A1=spdiags([onw, -onw],0:1,length(w),length(w));
w=sign(A1*w'); %signs for increasing/decreasing
A2=spdiags([onw, onw],-1:0,length(w),length(w));  
w=A2*w;
w=find(~w);% result for Step 1 
w=[1;w]; % completition of this: Step 6.


A1=A1([1:length(w)],[1:length(w)]);
A2=A2([1:length(w)],[1:length(w)]); 

% Step 7

if length(w)==2
    w_interp=interp1(w', w_orig(w)', [1:1:length(w_orig)],"linear","extrap");
elseif length(w)==1
    w_interp=w_orig;
elseif length(w)==3
    w_interp=interp1(w', w_orig(w)', [1:1:length(w_orig)],"linear","extrap");
elseif length(w)==4
    w_interp=interp1(w', w_orig(w)', [1:1:length(w_orig)],"linear","extrap");
else

    w_cv=w_orig(w); % extrema
w_cv=A2*w_cv'/2; %average of extrema
w_cv(1)=[]; w_cv(end)=[]; w_cv(end)=[]; % Step 6
w_mp=A2*w/2; % Step 4
w_mp(1)=[]; w_mp(end)=[]; w_mp(end)=[]; % Step 6
ceil(w_mp); 
w_interp=interp1(ceil(w_mp)', w_cv', [1:1:length(w_orig)],"linear","extrap");% Step 5
end


M_interp= [M_interp; w_interp];
end

dlmwrite('interp_scattered_Noisy_NearFieldData.txt',M_interp,'delimiter',' ','newline','pc')

end

