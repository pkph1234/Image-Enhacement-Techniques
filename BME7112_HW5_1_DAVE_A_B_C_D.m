clc;
close all;
clear all;
% Menu Selection:
Choise = menu('Change the display levels Techniques:','1) Linear transfer curves.','2) Logarithmic transfer curves.','3) Exponential transfer curves.','4) Broken linear transfer curves.');
if Choise == 1
    disp('Processing the linear technique:')
    Image =(imread('BME7112_Data_File_5.tif'));
    % finding the max and minimum values in the image
h = (max(Image(:)));
h = double(h);% convert into double to make same platform for doing the mathematical operation
i = (min(Image(:)));
i = double(i);
[x,y,z] = size(Image);
select = menu('Slope','1) Positive Slope','2) Negative Slope');
if select ==1
    ref = (0:255);% making the grayscale level between [0-255].
else
    ref = (0:255);
    ref = flip(ref);
end

a = input('Enter the constant factor : ');
count = 0;
lut(:,1) = a*(255*(ref-i)./(h-i));% performing the Linear tranformation equation
lut(:,1) = uint8(lut);% convert it into [0-255];
figure()
plot(lut)
title('LUT plot');
xlabel('Original Value');
ylabel('Transformed value')
grid on
c = lut;
lut(:,2) = lut;
lut(:,3) = c;% making the colormap in gray.
% Image A is using to find the histogram. here I am changing the value of
% the image according to the LUT to show histogram.it is used to show
% histogram but not for the original image for the original image i have
% used the colormap.
for i = 1:x
    for j = 1:y
        x = Image(i,j);
        x = x+1;
        ImageA(i,j) = lut(x);
    end
end
ImageA = uint8(ImageA);
lut = lut./max(lut(:));% normalise the LUT.
% showing the plots.
figure()
image(Image)
colormap(lut)
title('Transformed Image')
figure()
subplot(1,2,1)
imhist(Image)
title('Histogram of original Image')
subplot(1,2,2)
imhist(ImageA)
title('Histogram of transform image')




else if Choise ==2
        select = menu('Choose the Log Transfer curve technique:','1) Log10','2) Log2','3) Natural Log (Log)');
        if select == 1
            Image =(imread('BME7112_Data_File_5.tif'));
[x,y,z] = size(Image);
ref = (0:255);
a = 255/log10(255);% this is the scalling factor that makes the log plot more adaptive.
x1 = input('Give the input to chnage the slop of the plot : ');% here you can scale the value according to the requirements.
count = 0;
lut(:,1) = a*log10(x1*ref);% basic log base 10 operation 
lut(:,1) = uint8(lut);
lut = rescale(lut,0,255);
figure()
plot(lut)
title('LUT plot');
xlabel('Original Value');
ylabel('Transformed value')
grid on
c = lut;
lut(:,2) = lut;
lut(:,3) = c;
% performing to plot the histogram.here chnage the value in the image.
for i = 1:x
    for j = 1:y
        x = Image(i,j);
        x = x+1;
        ImageA(i,j) = lut(x);
    end
end
ImageA = uint8(ImageA);
lut = lut./max(lut);
figure()
image(Image)
colormap(lut)
title('Transformed Image')
figure()
subplot(1,2,1)
imhist(Image)
title('Histogram of original Image')
subplot(1,2,2)
imhist(ImageA)
title('Histogram of transform image')


        else if select == 2
                Image =(imread('BME7112_Data_File_5.tif'));
[x,y,z] = size(Image);
ref = (0:255);
a = 255/log2(255);
x1 = input('Give the input to chnage the slop of the plot : ');
count = 0;
lut(:,1) = a*log2(x1*ref);
lut(:,1) = uint8(lut);
% performing to plot the histogram.here chnage the value in the image.
for i = 1:x
    for j = 1:y
        x = Image(i,j);
        x = x+1;
        ImageA(i,j) = lut(x);
    end
end
ImageA = uint8(ImageA);
lut = rescale(lut,0,255);
figure()
plot(lut)
title('LUT plot');
xlabel('Original Value');
ylabel('Transformed value')
grid on
c = lut;
lut(:,2) = lut;
lut(:,3) = c;
% performing to plot the histogram.here chnage the value in the image.
for i = 1:x
    for j = 1:y
        x = Image(i,j);
        x = x+1;
        ImageA(i,j) = lut(x);
    end
end
ImageA = uint8(ImageA);
lut = lut./max(lut); 
figure()
image(Image)
colormap(lut)
title('Transformed Image')
figure()
subplot(1,2,1)
imhist(Image)
title('Histogram of original Image')
subplot(1,2,2)
imhist(ImageA)
title('Histogram of transform image')
            else
                Image =(imread('BME7112_Data_File_5.tif'));
[x,y,z] = size(Image);
ref = (0:255);
a = 255/log(255);
x1 = input('Give the input to chnage the slop of the plot : ');
count = 0;
lut(:,1) = a*log(x1*ref);
lut(:,1) = uint8(lut);
lut =  rescale(lut,0,255);
figure()
plot(lut)
title('LUT plot');
xlabel('Original Value');
ylabel('Transformed value')
grid on


c = lut;
lut(:,2) = lut;
lut(:,3) = c;
% performing to plot the histogram.here chnage the value in the image.
for i = 1:x
    for j = 1:y
        x = Image(i,j);
        x = x+1;
        ImageA(i,j) = lut(x);
    end
end
ImageA = uint8(ImageA);
lut = lut./max(lut);
figure()
image(Image)
colormap(lut)
title('Transformed Image')
figure()
subplot(1,2,1)
imhist(Image)
title('Histogram of original Image')
subplot(1,2,2)
imhist(ImageA)
title('Histogram of transform image')
            end
            
        end
    else if Choise == 3
            Image =(imread('BME7112_Data_File_5.tif'));
figure()
imshow(Image)
title('Original Image')
[x,y,z] = size(Image);
ref = (0:255);
x1 = input('Enter the slope (if you want negetive exponential type -5 if you want positive exponential type 5) : ');
count = 0;
lut(:,1) = exp((x1*ref/255));
lut =  rescale(lut,0,255);
figure()
plot(lut)
title('LUT plot');
xlabel('Original Value');
ylabel('Transformed value')
grid on
% making the LUT for gray scale
c = lut;
lut(:,2) = lut;
lut(:,3) = c;
% performing to plot the histogram.here chnage the value in the image.
for i = 1:x
    for j = 1:y
        x = Image(i,j);
        x = x+1;
        ImageA(i,j) = lut(x);
    end
end
ImageA = uint8(ImageA);
lut = lut./max(lut);
figure()
image(Image)
colormap(lut)
title('Transformed Image')
figure()
subplot(1,2,1)
imhist(Image)
title('Histogram of original Image')
subplot(1,2,2)
imhist(ImageA)
title('Histogram of transform image')
        else
            Image =(imread('BME7112_Data_File_5.tif'));
[x,y,z] = size(Image);
select = menu('Slope','1) Positive Slope','2) Negative Slope');
if select ==1
    ref = (0:255);
else
    ref = (0:255);
    ref = flip(ref);% Used for negetive slope
end
h = (max(Image(:)));
h = double(h);
i = (min(Image(:)));
i = double(i);
count = 0;
a = input('Enter the scalling factor');
lut(:,1) = a*(255*(ref-i)./(h-i));
lut =  rescale(lut,0,255);
figure()
plot(lut)
title('LUT plot');
xlabel('Original Value');
ylabel('Transformed value')
grid on
c = lut;
lut(:,2) = lut;
lut(:,3) = c;
start_point = input('Enter 1st break point : ');
end_point = input('Enter the 2nd break point : ');
lut(start_point:end_point,:) = lut(start_point);
for i = 1:x
    for j = 1:y
        x = Image(i,j);
        x = x+1;
        ImageA(i,j) = lut(x);
    end
end
ImageA = uint8(ImageA);
lut = lut./max(lut);
figure()
image(Image)
colormap(lut)
title('Transformed Image')
figure()
subplot(2,1,1)
imhist(Image)
title('Histogram of original Image')
subplot(2,1,2)
imhist(ImageA)
title('Histogram of Linear transfer curve Image')
figure()
lut = lut.*255;
plot(lut)
title('LUT plot');
xlabel('Original Value');
ylabel('Transformed value')
grid on
        end
    end
end




                