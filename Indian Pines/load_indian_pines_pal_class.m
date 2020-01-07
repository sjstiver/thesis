function [all_data, all_labels, label_name] = load_indian_pines_pal_class(classes,sample_num,file)
%[data, labels] = load_indian_pines(classes,sample_num,file)
% Load data from the Indian Pines data set
% Input: classes = vector of desired classes (1-16)
% Input: sample_num = scalar or vector of desired number of samples from
%   each class; if vector need length(sample_num)==length(classes)
% Input: file = 'fix' or 'raw'
% Output: data = matrix of IP data, column major, selected randomly
% Output: labels = digit labels for each point in data

d = length(classes);

class_labels = {'Alfalfa','Corn-notill','Corn-mintill','Corn','Grass-pasture',...
    'Grass-trees','Grass-pasture-mowed','Hay-windrowed','Oats','Soybean-notill',...
    'Soybean-mintill','Soybean-clean','Wheat','Woods','Buildings-Grass-Trees-Drives',...
    'Stone-Steel-Towers'};

if length(sample_num)==1
    sample_num = repmat(sample_num,1,d);
else
    if length(sample_num)~=d
        fprintf('Incorrect number of sample sizes specified')
        return
    end
end

load('IPclasses.mat')
all_data = [];
all_labels = [];

% Collect data
for i = 1:d
    class = classes(i);
    class_data = P{class};
    if size(class_data,2) < sample_num(i)
        sample_num(i) = size(class_data,2);
        fprintf('Sample number for class %.0f reduced to %.0f\n',class,sample_num(i))
    end
    data = datasample(class_data,sample_num(i),2,'Replace',false);
    all_data = [all_data data];
    all_labels = [all_labels class*ones(1,sample_num(i))];
    label_name{i} = class_labels{class};
end