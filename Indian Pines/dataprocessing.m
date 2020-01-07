% indian pines processing file
clear all, close all, clc

load('Indian_pines.mat')
load('Indian_pines_corrected.mat')
load('Indian_pines_gt.mat')

class_labels = {'None','Alfalfa','Corn-notill','Corn-mintill','Corn','Grass-pasture',...
    'Grass-trees','Grass-pasture-mowed','Hay-windrowed','Oats','Soybean-notill',...
    'Soybean-mintill','Soybean-clean','Wheat','Woods','Buildings-Grass-Trees-Drives',...
    'Stone-Steel-Towers'};

data1 = [];
data2 = [];
labels = [];
coords = [];

for i = 0:16
    [coords1,coords2] = find(indian_pines_gt == i);
    n = length(coords1);
    for j = 1:n
       d1 =  permute(indian_pines(coords1(j),coords2(j),:),[3 1 2]); 
       d2 = permute(indian_pines_corrected(coords1(j),coords2(j),:),[3 1 2]);
       data1 = [data1 d1];
       data2 = [data2 d2];
    end
    labels = [labels i*ones(1,n)];
    coords = [coords; coords1 coords2];
end

data = data1;
save('ip_data_raw.mat','data','labels','coords')
data = data2;
save('ip_data_fix.mat','data','labels','coords')