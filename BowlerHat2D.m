function imda = BowlerHat2D(im,si,no)
%BowlerHat2D - multiscale vessel enhancement method

o = 0:180/no:180-180/no; %number of orientation

imol = zeros(size(im,1),size(im,2),length(s),length(o));
imod = zeros(size(im,1),size(im,2),length(s));
for i=1:length(s)
   for j=1:length(o)
       se = strel('line',s(i),o(j));
       imol(:,:,i,j) = imopen(im,se);
   end
   se = strel('disk',round(s(i)/2));
   imod(:,:,i) = imopen(im,se);
end

imd = zeros(size(im,1),size(im,2),length(s));
imr = zeros(size(im,1),size(im,2),length(s));
imm = zeros(size(im,1),size(im,2),length(s));

triv = imod==0;
for i=1:length(s)
   imm(:,:,i) = max(squeeze(imol(:,:,i,:)),[],3);   % Max for all lines
   imd(:,:,i) = imm(:,:,i) - imod(:,:,i);           % Diff betwen disk and line
end
imr(triv) = 0;
imda = max(imd,[],3);
imda= double(imda); imda = (imda - min(imda(:))) / (max(imda(:)) - min(imda(:)));
end
