%% clear clc; clear; close all;

%% Load Image 
im=imread('jellyfish.png');

%% Normalize
% im = rgb2gray(im);                   % use when the data is rgb format
im = imcomplement(im);                 % use when the background is white and vessels are black
im = Normalize(im);

%% Bowler Hat 2D
si = 15;                              % size of the disk
no = 30;                              % number of orientation
bh = BowlerHat2D(im,si,no);           % call the bowler-hat script
%% Plot
figure; 
subplot(121); imagesc(im); colormap jet; axis off; axis equal; axis tight; title('original');
subplot(122); imagesc(bh); colormap jet; axis off; axis equal; axis tight; title('bowler-hat');
