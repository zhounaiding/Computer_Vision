function [albedoImage, surfaceNormals] = photometricStereo(imArray, lightDirs)
% PHOTOMETRICSTEREO compute intrinsic image decomposition from images
%   [ALBEDOIMAGE, SURFACENORMALS] = PHOTOMETRICSTEREO(IMARRAY, LIGHTDIRS)
%   comptutes the ALBEDOIMAGE and SURFACENORMALS from an array of images
%   with their lighting directions. The surface is assumed to be perfectly
%   lambertian so that the measured intensity is proportional to the albedo
%   times the dot product between the surface normal and lighting
%   direction. The lights are assumed to be of unit intensity.
%
%   Input:
%       IMARRAY - [h w n] array of images, i.e., n images of size [h w]
%       LIGHTDIRS - [n 3] array of unit normals for the light directions
%
%   Output:
%        ALBEDOIMAGE - [h w] image specifying albedos
%        SURFACENORMALS - [h w 3] array of unit normals for each pixel
%
% Author: Subhransu Maji
%
% Acknowledgement: Based on a similar homework by Lana Lazebnik


%%% implement this %% 

[h, w, n] = size(imArray);

imArray = reshape(imArray, [h * w, n]);
surfaceNormals = imArray * pinv(lightDirs');
surfaceNormals = reshape(surfaceNormals, [h, w, 3]);

albedoImage = sqrt(sum(surfaceNormals.^2, 3));
surfaceNormals = surfaceNormals ./ albedoImage;


% albedoImage = zeros(h, w);
% surfaceNormals = zeros(h, w, 3);
% 
% for i = 1:h
%     for j = 1:w
%         b = imArray(i, j, :);
%         g = lightDirs \ b(:);
%         albedoImage(i, j) = norm(g);
%         surfaceNormals(i, j, :) = g ./ norm(g);
%     end
% end