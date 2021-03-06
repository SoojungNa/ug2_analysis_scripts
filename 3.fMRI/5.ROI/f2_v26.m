clear;

addpath(genpath('C:\Users\SN\Desktop\spm12'));
addpath(genpath('C:\Users\SN\Google Drive\z.programs\marsbar-0.44'));

spm_name = {'C:\Users\SN\Google Drive\p1.UG2_fMRI\180422_eta.8\6.group\v26_f2_nxV_2blocks_IC\output\SPM.mat'; ...
    'C:\Users\SN\Google Drive\p1.UG2_fMRI\180422_eta.8\6.group\v26_f2_nxV_2blocks_NC\output\SPM.mat'; ...
'C:\Users\SN\Google Drive\p1.UG2_fMRI\180422_eta.8\6.group\v26_f2_nxV_2blocks_both\output\SPM.mat'};
load(spm_name{1});
for i = 1: length(SPM.xY.P)
    aa = strsplit(SPM.xY.P{i}, {'_', '.'});
    id{i, 1} = aa{7};
end
 
roi_folder = {'C:\Users\SN\Google Drive\p1.UG2_fMRI\180422_eta.8\7.roi\201025_6_52_-16_Feng2015_8mm\'}; 

a = 1;
for f = 1:length(roi_folder)
    cd(roi_folder{f})
    ROIs = dir('*roi.mat');
    for i = 1:length(ROIs)
        roi_file{a, 1} =[roi_folder{f}, ROIs(i).name];
        a = a + 1;        
    end
    cd ..
end

roi_source = {'f-test positive_effect peak'};

for i = 1:length(roi_file)
    roi = maroi(roi_file{i});
    for j = 1:length(spm_name)
        if i == 1
            eval(['D',int2str(j),' = mardo(spm_name{j});']); 
        end
        eval(['Y = get_marsy(roi, D',int2str(j),', ''mean'');']);
        temp = summary_data(Y);
        if i==1&&j==1
            result = temp;
        else
            result = [result,temp];
        end
    end
end

cd(fullfile(roi_folder{1}, 'results'));
save('f2_v26.mat', 'result', 'spm_name', 'roi_file', 'roi_source', 'id');
