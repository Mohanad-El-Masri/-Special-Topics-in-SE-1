clear, close all; clc;warning('off'),
addpath(genpath(cd));

window = 3;
datasets = {'Indian','PaviaU'};
datasets = {'Indian'};


for idataset = 1:length(datasets)
    dataset = datasets{idataset};
    Predict_labels = [];

    if strcmp(dataset,'Indian')==1
        load Indian_pines_corrected.mat;load Indian_pines_gt.mat;
        %load indianpinesgeneratedpcadata.mat
        load paviageneratedpcadata.mat
        %paviaU = reducedDataCubeh3;
        %paviaU = reducedDataCubeh5;
        %paviaU = reducedDataCubeh10;
        %paviaU = reducedDataCubeh20;
        %paviaU = reducedDataCubeh25;

        paviaU = indian_pines_corrected;

        paviaU_gt = indian_pines_gt;
        trainnumber = 0.1; Ratio = 0.1; %0.0812;% the value of Ratio can be obtained by the function of "Edge_ratio3" in the function of "cubseg"

    elseif strcmp(dataset,'PaviaU')==1
        load Pavia.mat;load Pavia_gt.mat;
        paviaU = pavia;
        paviaU_gt = pavia_gt;
        trainnumber = 50; Ratio = 0.2;
    end
end

% smoothing
for i=1:size(paviaU,3)
    paviaU(:,:,i) = imfilter(paviaU(:,:,i),fspecial('average',window));
end

SegPara = 30;
% superpixel segmentation
labels = cubseg(paviaU,SegPara*Ratio);

method = {'SVM'};
lambdaa   = [0.01 0.1 1 10]; % SVM

randp = randpGen(paviaU_gt,1);
randpp=randp{1};

% randomly divide the dataset to training and test samples

[DataTest, DataTrain, CTest, CTrain, Loc_test] = samplesdivide(paviaU,paviaU_gt,trainnumber,randpp);
trainlabel = getlabel(CTrain);
testlabel  = getlabel(CTest);
[Predict_label, ~,~] = svmpredict(testlabel', DataTest, svmtrain(trainlabel', DataTrain, ['-q -b 1']), '-b 1');    Predict_label =Predict_label';
[confusion, accur_NRS, TPR, FPR] = confusion_matrix_wei(Predict_label, CTest);
AV = mean(TPR);
%OA = mean(TPR);
%accy(idataset,1,1,igamma,ilambda) = accur_NRS;