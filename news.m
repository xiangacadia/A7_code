clear; clc;
% load
data_train = textread('train.data');
data_train(:, 3) = 1;
matrix_train = spconvert(data_train);
labels_train = textread('train.label');

data_test = textread('test.data');
data_train(:, 3) = 1;
matrix_test = spconvert(data_test);
labels_test = textread('test.label');
matrix_test = matrix_test(:,1:53975);


% build models
F = sparse(53975, 20);
for i=1:20
    matrix_train_i = matrix_train(labels_train==i,:);
    F(:,i) = mean(matrix_train_i);
    F(F(:,i)==0, i) = 0.00001;
end

F0 = 1 - F;

logF0 = log(F0);
logF = log(F);

likelihood_train = matrix_train * logF + (1 - matrix_train)*logF0;
[~,train_pred] = max(likelihood_train,[], 2);
mean(labels_train==train_pred)

likelihood = matrix_test * logF + (1 - matrix_test)*logF0;
[~, test_pred] = max(likelihood,[], 2);

mean(labels_test==test_pred)

confusionmat(labels_test, test_pred)

% training accuracy: 97.56%
% testing accuracy: 74.04%
