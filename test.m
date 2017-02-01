function test(net,img1)
    close all;
    convnet2=load('convnet-fine');
    convnet2=convnet2.convnet;
    convnet1=load('convnet-coarse');
    convnet1=convnet1.convnet_coarse;
    labels2=zeros(size(convnet2.Layers(17).ClassNames));
    scores2=zeros(size(convnet2.Layers(17).ClassNames));
    counts2=zeros(size(convnet2.Layers(17).ClassNames));
    labels1=zeros(size(convnet1.Layers(12).ClassNames));
    scores1=zeros(size(convnet1.Layers(12).ClassNames));
    counts1=zeros(size(convnet1.Layers(12).ClassNames));
    x=[];
    t=[];
    img=im2double(rgb2gray(img1));
    if(size(img,1)>size(img,2))
        img=img';
    end
    x(end+1,:)=img(:);
    y=zeros(size(x,1),size(x,2));
    names=fieldnames(net);
    m=0;
    for j = 1 : size(names,1)
        t1=getfield(net,strcat('net',int2str(j)));
        t2=vec2ind(t1(x(1,:)));
        if(m<size(unique(y(end,:)),2))
            y(1,:)=t2;
        end
    end
    uniq=unique(y(1,:));
    for j = 1 : size(uniq,2)
        ind=find(y(1,:)==uniq(j));
        img(:)=x(1,:,:);
        img2=zeros(size(img));
        for k = 1 : size(ind,2)
            [c,r]=ind2sub(size(img),ind(k));
            if(size(img,1)==size(img1,1))
                img2(c,r)=1;
            else
                img2(r,c)=1;
            end
        end
        cc=bwconncomp(img2);
        for k = 1 : cc.NumObjects
            if(size(cc.PixelIdxList{1,k},1)<100)
                continue;
            end
            img3=zeros(size(img2));
            img3(cc.PixelIdxList{1,k})=1;
            x11=1;
            x12=size(img3,2);
            y11=1;
            y12=size(img3,1);
            while sum(img3(:,x11))==0
                x11=x11+1;
            end
            while sum(img3(:,x12))==0
                x12=x12-1;
            end
            while sum(img3(y11,:))==0
                y11=y11+1;
            end
            while sum(img3(y12,:))==0
                y12=y12-1;
            end
            img3=imcrop(img1,[x11 y11 x12-x11 y12-y11]);
            if(numel(img3)==0)
                continue;
            end
            [label,score]=classify(convnet1,imresize(img3,[32 32]));
            [b,a]=max(score);
            if(b > 0.85)
                labels1(a)=labels1(a)+1;
                scores1(a)=scores1(a)+b;
                counts1(a)=counts1(a)+1;
            end
            [label,score]=classify(convnet2,imresize(img3,[32 32]));
            [b,a]=max(score);
            if(b > 0.85)
                labels2(a)=labels2(a)+1;
                scores2(a)=scores2(a)+b;
                counts2(a)=counts2(a)+1;
            end
        end
    end
    label1={convnet1.Layers(12).ClassNames(find(labels1>1)) scores1(find(labels1>1))./counts1(find(labels1>1))};
    label2={convnet2.Layers(17).ClassNames(find(labels2>1)) scores2(find(labels2>1))./counts2(find(labels2>1))};
    labels=[label1 label2];
    figure,imshow(img1);
    figure,bar(label1{1,2});
    ax=gca;
    ax.XTickLabels=label1{1,1};
    ax.XTickLabelRotation=45;
    ylabel('Confidence');
    xlabel('Class Names');
    figure,bar(label2{1,2});
    ax=gca;
    ax.XTickLabels=label2{1,1};
    ax.XTickLabelRotation=45;
    ylabel('Confidence');
    xlabel('Class Names');
    display('Detected Objects');
    display(label2{1,1});
end