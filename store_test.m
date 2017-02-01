      test = load('test.mat');
      meta=load('meta.mat');
      fine_label_names=meta.fine_label_names;
      data=test.data;
      fine_labels=test.fine_labels;
      filenames=test.filenames;
     % path='./test_fine';
%      for j = 1 : size(data,1)
 %       img=zeros(32,32,3);
  %      for i = 1 : 3072
   %         [c,r,ch]=ind2sub(size(img),i);
    %        img(c,r,ch) = data(j,i);
     %   end
      %  img=img/255;
       % imwrite(img,char(strcat(path,'./',fine_label_names(fine_labels(j)+1),'./',filenames(j))));
        %mkdir(char(strcat(path,'./',fine_label_names(j))));
      
      