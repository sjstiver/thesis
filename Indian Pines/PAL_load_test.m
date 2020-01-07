% ip test load
clear all

file = 'fix';
sample_num = 10000;
classes = 1:14;
[all_data, all_labels, label_name] = load_indian_pines_pal_class(classes,sample_num,file);
