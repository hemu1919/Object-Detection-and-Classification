function [labels,scores] = convpredict( convnet )
%PREDICT Summary of this function goes here
%   Detailed explanation goes here
    imdsTest = imageDatastore('.\test_coarse','IncludeSubfolders', true, 'FileExtensions', '.png', 'LabelSource', 'foldernames');
    [labels,scores]=classify(convnet,imdsTest);
   % performance(labels, fine_label_names, fine_labels)
    disp('Accuracy')
    performance(labels,imdsTest.Labels);
end
