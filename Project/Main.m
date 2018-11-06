%Clearing the command line
warning off %#ok<WNOFF>
clc
close all
clear all

% To read the file from a select file menu using uigetfile
[filename, pathname] = uigetfile('*','Select an Image');
image=imread(fullfile(pathname, filename));

% Show image
figure();
imshow(image);
title('Given image as it is:');

% Convert to gray scale
if size(image,3)==3 %RGB image
    image=rgb2gray(image);
end
figure();
imshow(image);
title('Image after converting into gray scale:');

% Convert to BW
threshold = graythresh(image);
image =~im2bw(image,threshold);
figure();
imshow(image);
title('Image after converting into Black and white:');

