%in the name of allah
clc;
clear all
close all

%% Step 1: Pre-Processing
%input the image
Img=imread('2.jpg');

%change the size of imege
Img = imresize(Img,[200 250]);

%show the image
subplot(3,1,1);
imshow(uint8(Img));
title('Main Image')

%convert RGB Image to Gray
II=rgb2gray(Img);
subplot(3,1,2);
imshow(uint8(II));
title('Gray Image')

% Median Filter
II = medfilt2(II);
subplot(3,1,3);
imshow(uint8(II));
title('Median filter Image')

%determine size of image
nrows = size(II,1);
ncols = size(II,2);


%% Step 2: Image Segmentation
% histogram
[counts, binlocation] = imhist(II);  %plus whatever option you used for imhist

% Detect the best Threshold
[~,locs_Rwave] = findpeaks(counts,'MinPeakHeight',60,'MinPeakDistance',30,'Annotate','extents');
r=find((locs_Rwave>100) & (locs_Rwave < 150));
r1=counts(locs_Rwave(r):locs_Rwave(r+1));
[r3,r2]=min(r1);

%show the Histogram and the Threshold
figure
imhist(II)
hold on
plot([r2+locs_Rwave(r)-1,r2+locs_Rwave(r)-1],[0 1000],'-*r','LineWidth',2)
level= (r2+locs_Rwave(r)-1)/256;

% change image to binary Image
II2=double(II);

% for small circle
BW = im2bw(II,level);
for j=1:2
    a1=BW==j-1;
    if j==1
        II2(a1)=1;
    else
        II2(a1)=255;
    end
end
figure
imshow(uint8(II2));



% for big circle
II3=double(II);

level = graythresh(II);
BW = im2bw(II,level);
for j=1:2
    a1=BW==j-1;
    if j==1
        II3(a1)=1;
    else
        II3(a1)=255;
    end
end
figure
imshow(uint8(II3));

%% Step3: Edge Detection 

%Using Canny Filter
BW1 = edge((II),'Canny',[0.04 0.4]);
figure
imshow(BW1)


%% Step4: Fitting and Calculate
%find Circle

%Big Circle
figure
[centersf_big,radii_big] = imfindcircles((BW1),[58 70],'ObjectPolarity','bright','Sensitivity',0.98);
hBright = viscircles(centersf_big,radii_big)
BW2 = edge((II2),'Canny',[0.04 0.4]);
imshow(BW2)
hBright = viscircles(centersf_big,radii_big)


%core Circles
[centersf_core,radii_core] = imfindcircles(uint8(BW2),[2 7],'ObjectPolarity','bright','Sensitivity',0.92)
hBright = viscircles(centersf_core,radii_core)
figure
hBright = viscircles(centersf_core,radii_core)


%% comparison between different Method for edge detection
subplot(2,3,1);
BW_prewitt = edge(II,'prewitt');
imshow(BW_prewitt)
title('prewitt filter')
subplot(2,3,2);
BW_Sobel = edge(II,'Sobel');
imshow(BW_Sobel)
title('Sobel filter')
subplot(2,3,3);
BW_log = edge(II,'log');
imshow(BW_log)
title('log filter')
subplot(2,3,4);
BW_Roberts = edge(II,'Roberts');
imshow(BW_Roberts)
title('Roberts filter')
subplot(2,3,5);
BW1 = edge((II),'Canny',[0.04 0.4]);
imshow(BW1)
title('Canny filter')
