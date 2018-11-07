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

% Remove all object containing fewer than 20 pixels
figure();
imshow(image);
image = bwareaopen(image,15);
figure();
imshow(image);
title('After removing all objects fewer tha 20 pixels:');

%Storage matrix word from image
word=[ ];
re=image;
image = image - bwareaopen(image,70000);
figure();
imshow(image);
title('Did something');
