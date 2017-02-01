      test = load('test.mat');
      meta=load('meta.mat');
      coarse_label_names=meta.coarse_label_names;
      data=test.data;
      coarse_labels=test.coarse_labels;
      filenames=test.filenames;
     % path='./test_coarse';
%      for j = 1 : size(data,1)
 %       img=zeros(32,32,3);
  %      for i = 1 : 3072
   %         [c,r,ch]=ind2sub(size(img),i);
    %        img(c,r,ch) = data(j,i);
     %   end
      %  img=img/255;
       % imwrite(img,char(strcat(path,'./',coarse_label_names(coarse_labels(j)+1),'./',filenames(j))));
        %mkdir(char(strcat(path,'./',coarse_label_names(j))));
      
      