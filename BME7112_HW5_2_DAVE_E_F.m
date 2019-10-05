clc;
close all;
clear all;
Choise = menu('Histogram Equlization techniques::','1) Global Histogram Equilization.','2) Local Histogram Equilization:');
if Choise == 1
Image =(imread('BME7112_Data_File_5.tif'));
figure()
imshow(Image)
title('Original Image');
ImageA = Image;
[x,y,z] = size(Image);
ref = (0:255);
[x1,y1] = imhist(Image);% x1 = total number of pixel associated with pixel intensity
as = x*y;% find total number of pixels
Prob = x1./as;%Calculate the probability of each gray scale.
% find the cumulative probability
[a,b] = size(Prob);
sum = zeros(a,b);
sum(1,1) = Prob(1,1);
for i = 2:a
    sum(i,1) = sum(i-1,1) + Prob(i,1);
end
% multiply with 255 to get 255 gray scale level.
sum = floor(sum.*255);
% making the gray scale color map
lut(:,1) = sum;

lut(:,2) = sum;
lut(:,3) = sum;
% for finding the histogram, that is why the value is replaced according to
% the LUT
for i = 1:x
    for j = 1:y
        x = Image(i,j);
        x = x+1;
        ImageA(i,j) = lut(x);
    end
end
lut = lut./max(lut(:));
figure()
image(Image)
colormap(lut)
figure()
subplot(1,2,1)
imhist(Image)
title('Histogram of original Image')
subplot(1,2,2)
imhist(ImageA)
title('Histogram of transformed Image')
else Choise == 2
        Image =(imread('BME7112_Data_File_5.tif'));
figure()
imshow(Image)
[x,y] = size(Image);
Kernel_size = input('Enter the KErnel_size : ');
% mae sure that kernel size is odd if it is even it will increment by 1
if mod(Kernel_size,2) == 1
    Kernel_size = Kernel_size;
else
    Kernel_size = Kernel_size + 1;
end
% some calibration stuff to work with the for loop
start = (round(Kernel_size/2));
as = Kernel_size - start+1;
asd = as-1;
% ImageA = ImageA./max(ImageA(:));
[x,y,z] = size(Image);
filtered_ImageA = Image;
sum = zeros(Kernel_size,Kernel_size);
for a = 1:z
    for i = start:Kernel_size:x-start+1
        for j = start:Kernel_size:y-start+1
            sum = 0;
            for k = 1:Kernel_size
                for l = 1:Kernel_size
                   sum(k,l) = Image(k+i-as,l+j-as,a);% make the whole kernel in a matrix
                end
            end
            sum = uint8(sum);
            [L T] = histeq(sum,Kernel_size*Kernel_size);% used direct function to enhance the cntrats in the kernel
            filtered_ImageA(i-asd:i+Kernel_size-as,j-asd:j+Kernel_size-as) = L;% replace the wole kernel with trasnformed values.
        end
    end
end
figure()
imshow(filtered_ImageA)
title('Transformend Image');
figure()
subplot(1,2,1)
imhist(Image)
title('Histogram of original Image')
subplot(1,2,2)
imhist(filtered_ImageA)
title('Histogram of Transformed Image')
end
        
