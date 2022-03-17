clear
clc
close all
%% load data
% Question 1
hcube = hypercube('paviaU.dat');
%% normalize
% Question 2
data = rescale(hcube.DataCube);
ncube = assignData(hcube,':',':',':',data);
%% Show Image in 3 Wavelets
% Question 3
rgbImg = colorize(ncube,[36 10 29]);
figure; imshow(rgbImg); title('indian pines');
%% 
gt = load('Pavia_gt.mat');
gt = gt.pavia_gt;
numClasses = 9;
figure; imshow(28*gt); title('Ground Truth');
gtMask = gt>0;
gtClasses = uint8(255*ind2rgb(gt,hsv(9))).*repmat(uint8(gtMask),[1 1 3]) + ...
    255*repmat(uint8(~gtMask),[1 1 3]);
gtClassesPad = padarray(gtClasses,[1 1 0]);
figure; imshow(gtClassesPad); title('Ground Truth Class Labels');
%%
gt1 = sort(reshape(gt, [1096*715,1]));
figure; histogram(gt1(635489:end))
%% 
reducedDataCubeh3 = hyperpca(hcube,3);
reducedDataCube3 = hyperpca(ncube,3);
imgColor3 = reducedDataCube3(:,:,[1 2 2]);
figure; imshow(imgColor3); title('reduced indian pines3');

reducedDataCubeh5 = hyperpca(hcube,5);
reducedDataCube5 = hyperpca(ncube,5);
rgbImg5 = reducedDataCube5(:,:,[1 2 2]);
figure; imshow(rgbImg5); title('reduced indian pines5');

reducedDataCubeh10 = hyperpca(hcube,10);
reducedDataCube10 = hyperpca(ncube,10);
rgbImg10 = reducedDataCube10(:,:,[1 2 2]);
figure; imshow(rgbImg10); title('reduced indian pines10');

reducedDataCubeh20 = hyperpca(hcube,20);
reducedDataCube20 = hyperpca(ncube,20);
rgbImg20 = reducedDataCube20(:,:,[1 2 2]);
figure; imshow(rgbImg20); title('reduced indian pines20');

reducedDataCubeh25 = hyperpca(hcube,25);
reducedDataCube25 = hyperpca(ncube,25);
rgbImg25 = reducedDataCube25(:,:,[1 2 2]);
figure; imshow(rgbImg25); title('reduced indian pines25');

%%
similarityMatrix3 = similarityMatrix(reducedDataCube3,3);
figure; heatmap(similarityMatrix3)
title('similarityMatrix3')

similarityMatrix5 = similarityMatrix(reducedDataCube5,5);
figure; heatmap(similarityMatrix5)
title('similarityMatrix5')

similarityMatrix10 = similarityMatrix(reducedDataCube10,10);
figure; heatmap(similarityMatrix10)
title('similarityMatrix10')

similarityMatrix20 = similarityMatrix(reducedDataCube20,20);
figure; heatmap(similarityMatrix20)
title('similarityMatrix20')

similarityMatrix25 = similarityMatrix(reducedDataCube25,25);
figure; heatmap(similarityMatrix25)
title('similarityMatrix25')