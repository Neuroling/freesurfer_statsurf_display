function plot_HCPMMP(L,R,ThresholdValue,Range,StatLabel)
%Expects L and R to have 179 entries ordered according to the atlas labels.
%Any deviation from the order will mean the display is completely
%incorrect. It is essential to verify that the order is identical to that
%in the list in the script folder: seedtype_HCP-MMP1.txt
%L - list of values for Left Hemisphere parcels
%R - list of values for Right Hemisphere
%Threshold - set a minimum value for what to display, if you have p values,
%use a -ve value (e.g. -0.05)
%Range - plot what range of values? [min max]: e.g. for 'p' [0 0.05], for
%'scalar' depends upon what 
%StatLabel - what label is given to the scale bar - e.g. for Betas 'Beta'
%or for p values 'p'

%set values:
%add empty values for the ???? and hippcoampus entries
%check if vector or cell array
    Values{1}=[nan,L(1:119),nan,L(120:179)];
    Values{2}=[nan,R(1:119),nan,R(120:179)];
for V=1:2
    if ThresholdValue>0
        ValuesMask{V}=abs(Values{V})>ThresholdValue;
    else
        ValuesMask{V}=abs(Values{V})<-ThresholdValue;
    end
end
    freesurfer_statsurf_scalar(Values, ValuesMask, 'HCP-MMP1', 'NoLabels',true,'ValueLimits',Range,'ScalarName',StatLabel);
