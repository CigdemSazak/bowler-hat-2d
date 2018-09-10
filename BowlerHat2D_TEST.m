%   INPUT:
%       im    - 2D gray image,
%       si    - expected maximum width of the vessel,
%       no    - number of the directions,
%
%   OUTPUT:
%       Bh    - enhanced resultant image,
%
%   USAGE:
%      si = 15; no = 30; 
%      Bh = BowlerHat2D(im,si,no);   
%
%   AUTHOR:
%       Cigdem Sazak, Carl J Nelson, Boguslaw Obara, http://boguslawobara.net/

%% Clear 
clc; clear all; close all;

%% Load Image
im=imread('./im/test.png');
 
% Normalize
% im = rgb2gray(im);                   % use when the data is rgb format
% im = imcomplement(im);               % use when the background is white and vessels are black
im = double(im); im = (im - min(im(:))) / (max(im(:)) - min(im(:))); % normalize the input image.

%% Bowler Hat
si = 20;                              % size of the disk element
no = 15;                              % number of orientation
bh = BowlerHat2D(im,si,no);           % call the bowler-hat script

%Plotting
figure; 
subplot(121); imagesc(im); colormap jet; axis off; axis equal; axis tight; title('original');
subplot(122); imagesc(Bh); colormap jet; axis off; axis equal; axis tight; title('bowler-hat');
