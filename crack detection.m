%% created by renny thomas 
%% date 2/2/2017
%% load image
I=imread('3.jpg');
figure,imshow(I)
title('Original image')


%% Image adjust 
Istrech = imadjust(I,stretchlim(I));
figure,imshow(Istrech)
title('Contrast stretched image')



%% Convert RGB image to gray
Igray_s = rgb2gray(Istrech);
figure,imshow(Igray_s,[])
title('RGB to gray (contrast stretched) ')


 
%% Image segmentation by thresholding
%use incremental value to run this selection 
%till required threshold 'level' is          
%achieved
level = 0.2;
Ithres = im2bw(Igray_s,level);
figure,imshow(Ithres)
title('Segmented cracks')
Ithres = ~Ithres;
figure,imshow(Ithres)


 
BW = bwmorph(Ithres,'thin', inf);
figure,imshow(BW)
title('Thinned image')
BW = imfill(Ithres, 'holes');
figure,imshow(BW)
title('Filled image')


%% Image morphological operation
BW = bwmorph(Ithres,'clean',10);
figure,imshow(BW)
title('Cleaned image')
 
figure,imshow(BW)
title('final output')
