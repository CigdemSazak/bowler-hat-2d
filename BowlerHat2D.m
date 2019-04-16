function imda = BowlerHat2D(im,si,no)
%BowlerHat2D - multiscale vessel enhancement method

o = 0:180/no:180-180/no; %number of orientation

imol = zeros(size(im,1),size(im,2),length(si),length(o));
imod = zeros(size(im,1),size(im,2),length(si));
for i=1:length(si)
   for j=1:length(o)
       se = strel('line',si(i),o(j));
       imol(:,:,i,j) = imopen(im,se);
   end
   se = strel('disk',round(si(i)/2));
   imod(:,:,i) = imopen(im,se);
end

imd = zeros(size(im,1),size(im,2),length(si));
imr = zeros(size(im,1),size(im,2),length(si));
imm = zeros(size(im,1),size(im,2),length(si));

triv = imod==0;
for i=1:length(si)
   imm(:,:,i) = max(squeeze(imol(:,:,i,:)),[],3);   % Max for all lines
   imd(:,:,i) = imm(:,:,i) - imod(:,:,i);           % Diff betwen disk and line
end
imr(triv) = 0;
imda = max(imd,[],3);
imda= double(imda); imda = (imda - min(imda(:))) / (max(imda(:)) - min(imda(:)));
end
