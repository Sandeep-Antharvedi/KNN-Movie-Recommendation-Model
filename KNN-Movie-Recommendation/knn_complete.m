clear all
clc
close all

%Movie.csv contains all the data and ratings related to a particular movie.

d=importdata('movie.csv')%%% use this command if the file contain text data

%%%%convert the text data into numbers.

 [m,n]=size(d.data)
%check the d.data in command window to understand the values in it
 ytrain=1:1:m
 %preparing the feature matrix, removing name and the serial number from
 %the given file
 X=[d.data(:,1:end)]%%% Final feature matrix with all numerical data
 X=featureNormalize(X)%%% Normalising feature
 
 

%  %%%%%% KNN algorithm
% % %step-1:Input no of k-neighbors
  k=10;
%  %step-2: calculate euclidean distance for new data set (consider test data set as new points)
% % %i=1;
  Xtrain=X;%%%Training data which has to be classified
  yactual=ytrain;%%%here the target variables are just the s.no of the movies
  
  %%%consider i have watched star wars movie (s.NO:49) in the list and plus
  %%%one is added to take care title row at the first
  s=49+1
  Xtest=X(s,:)
   ypred=knn(Xtrain,ytrain,k,Xtest);%%%X belongs to new data set 

   %%%Movie you have seen
   fprintf('Movie you have seen recently: %s\n',d.textdata{s+1,2})
   
   %%%The recommended movies should be similar to that of star wars
   fprintf('Recommended movies by KNN algorithm are given below \n')
   
   %%%Ypred will give the s.no closest to the current movie and we are
   %%%printing it directly form textdata
   for i=1:1:length(ypred)
         fprintf('%i Movie : %s\n',i,d.textdata{ypred(i)+1,2})
   end




