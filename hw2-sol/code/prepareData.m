function output = prepareData(imArray, ambientImage)
% PREPAREDATA prepares the images for photometric stereo
%   OUTPUT = PREPAREDATA(IMARRAY, AMBIENTIMAGE)
%
%   Input:
%       IMARRAY - [h w n] image array
%       AMBIENTIMAGE - [h w] image 
%
%   Output:
%       OUTPUT - [h w n] image, suitably processed
%
% Author: Subhransu Maji
%

% Implement this %
% Step 1. Subtract the ambientImage from each image in imArray
% Step 2. Make sure no pixel is less than zero
% Step 3. Rescale the values in imarray to be between 0 and 1

imageNum = size(imArray, 3);
ambientImage_repeat = repmat(ambientImage, [1, 1, imageNum]);

output = imArray - ambientImage_repeat;
output(output < 0) = 0;
maxVal = max(output(:));
minVal = min(output(:));
output = (output - minVal) ./ (maxVal - minVal);