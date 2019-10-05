clc;
close all;
clear all;
Image =(imread('BME7112_Data_File_5.tif'));
% Image = rgb2gray(Image);
[x,y,z] = size(Image);
ref = (0:150);% for negetive Exponential
ref2 = (151:255);% for positive exponential
% ref = flip(ref);% for negetive linear slop
%a = 255/exp(1);
count = 0;
figure()
lut(1:151,1) = 1*exp((-3*ref/255));% perfoeming negetive exponential.
% lut = lut./max(lut(1:190));
lut = lut.*255;% it is normalised so convert it into between( 0 255)
lut(152:256,1) = 5*exp((3*ref2/255));% positive Exponential
% lut1 = lut1./max(lut1);
% lut1 = lut1.*255;
lut = uint8(lut);
% lut(191:256) = lut1(191:256);
plot(lut)
title('LUT Plot');
xlabel('Original value');
ylabel('Transformed Value');
grid on

% change the value in pixel according to the lut.
for i = 1:x
    for j = 1:y
        x = Image(i,j);
        x = x+1;
        ImageA(i,j) = lut(x);
    end
end
% plot the images
figure()
ImageA = uint8(ImageA);
imshow(ImageA)
title('Transform Image');
% figure()
% Xc = ImageA - Image;
% imagesc(Xc);
% title('Difference');
% xc = ImageA - Image;
% imshow(Image-ImageA);
figure()
subplot(2,1,1)
imhist(Image)
title('Histogram of original Image')
subplot(2,1,2)
imhist(ImageA)
title('Histogram of transormed image')