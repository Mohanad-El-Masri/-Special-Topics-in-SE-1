clear; close all; clc

Ind = [0.03, 0.05, 0.10, 0.20, 0.25;0.5655 0.5871 0.5972 0.6220 0.6430;0.4042 0.4200 0.4530 0.4588 0.4590];
Pavi = [0.03, 0.05, 0.10, 0.20, 0.25;0.8866 0.8503 0.6142 0.8544 0.8581;0.6948 0.6532 0.4867 0.7153 0.6402];
Acc_ind = [0.05 0.10 0.20;0.5974 0.5653 0.5923; 0.4567 0.4365 0.4624];
Acc_pavi = [0.05 0.10 0.20;0.8644 0.8343 0.8423; 0.6689 0.6310 0.6250];

X = categorical({'3%','5%','10%','20%','25%'});
X = reordercats(X,{'3%','5%','10%','20%','25%'});

XX = categorical({'5%','10%','20%'});
XX = reordercats(XX,{'5%','10%','20%'}); 

figure
bar(X,Ind(2:3,:))
legend('OA','AA')
title('OA and AA values of Indian pine by classifying the reduced data')

figure
bar(X,Pavi(2:3,:))
legend('OA','AA')
title('OA and AA values of pavia by classifying the reduced data')

figure
bar(XX,Acc_ind(2:3,:))
legend('OA','AA')
title('classification for training ratios 5%, 10% and 20% of Indian pine')

figure
bar(XX,Acc_pavi(2:3,:))
legend('OA','AA')
title('classification for training ratios 5%, 10% and 20% of pavia')
