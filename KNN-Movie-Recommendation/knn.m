function y = knn(Xtrain,ytrain,k,Xtest)
%%% Xtest belongs to new data points for which we are trying to predict the
%%% output class
[m,n]=size(Xtest)
for i=1:1:m
    nx=Xtest(i,:);%%%the one row value will be stored in nx;(new data point)
 
    for j=1:1:length(Xtrain)%%% eculidian distance of new data point with all existing dataset
     ed(j,1)=sqrt(sum(Xtrain(j,:)-nx).^2);
     ed(j,2)=ytrain(j);
    end
    ed_sort=sortrows(ed);%step-3: Arranging the euclidian data in descending order
    %sortrows will sort the first coulmn only in row wise
    for p=1:1:k %%%%step-4: Storing the value of output till k neighbour
        eds(i,p)=ed_sort(p,2)
    end
     %eds matrix will store the nearest movies from the training set close
     %to the considered test movie
     y=eds
end