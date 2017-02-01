      train = load('train.mat');
      meta=load('meta.mat');
      coarse_label_names=meta.coarse_label_names;
      data=train.data;
      coarse_labels=train.coarse_labels;
      filenames=train.filenames;
      path='./train_coarse';
     % for j = 1 : 1000%size(data,1)
      %  img=zeros(32,32,3);
       % for i = 1 : 3072
        %    [c,r,ch]=ind2sub(size(img),i);
         %   img(c,r,ch) = data(j,i);
       % end
        %img=img/255;
        %imwrite(img,char(strcat(path,'./',coarse_label_names(coarse_labels(j)+1),'./',filenames(j))));
        %mkdir(char(strcat(path,'./',coarse_label_names(j))));
     % end