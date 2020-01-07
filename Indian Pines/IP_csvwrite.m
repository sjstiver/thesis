% File to write all IP data to CSV files for use in python

classes = [1:16];
sample_num = 100000; % enough to get all points
file = 'raw';
[all_data, all_labels, label_name] = load_indian_pines(classes,sample_num,file);

csvwrite('IP_labels.csv', all_labels)
csvwrite('IP_data_raw.csv', all_data)
csvwrite('IP_label_names.csv', label_name)

file = 'fix';
[all_data, all_labels, label_name] = load_indian_pines(classes,sample_num,file);
csvwrite('IP_data_fix.csv', all_data)

load('Indian_pines_gt.mat')
csvwrite('IP_gt_data.csv', indian_pines_gt)