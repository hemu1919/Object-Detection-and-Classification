
function convnet = convtrain()
%CONVIMG Summary of this function goes here
%   Detailed explanation goes here
 
     imdsTrain = imageDatastore('.\train_fine','IncludeSubfolders', true, 'FileExtensions', '.png', 'LabelSource', 'foldernames');
       layers = [imageInputLayer([32 32 3], 'DataAugmentation', 'randfliplr', 'Normalization', 'zerocenter');
                    convolution2dLayer([3 3],32,'Stride',1,'Padding',2);
                    reluLayer();
                  
                    
                    convolution2dLayer([3 3],64,'Stride',1,'Padding',2);
                    reluLayer();
                    maxPooling2dLayer(2,'Stride',2);
                    
                    convolution2dLayer([3 3],128,'Stride',1,'Padding',2);
                    reluLayer();
                    maxPooling2dLayer(2,'Stride',2);
                    
                    fullyConnectedLayer(100);
                    softmaxLayer();
                    classificationLayer()];
                
         options = trainingOptions('sgdm', 'MaxEpochs', 50, 'InitialLearnRate', 0.001);
         convnet = trainNetwork(imdsTrain, layers, options);  
         save('convnet.mat','convnet');
         
end
