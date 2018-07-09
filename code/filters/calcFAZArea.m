function FAZarea = calcFAZArea(im, varargin)
%% CALCFAZAREA calculates FAZ area in a segmented image
% Input:
%   im  :       segmented image
% 
% Optional:
%   convfact: conversion factor, depending on the system. Default = 0.0055
%
% Example:
%   convfact = 0.0055;
%   FAZarea = calcFAZArea(im, 'convfact', convfact)
%
%% Checking things
%
p = inputParser;

% default value
defaultFactor = 0.0055;

%
addParameter(p, 'convfact', defaultFactor, @isnumeric)

%
parse(p, varargin{:})

%%
im = double(im);    % crucial step, unit8-type input will result in wrong FAZ area
im = ceil(im/max(im(:)));
im = imcomplement(im);
% FAZpixel = sum(im(:));

FAZpixel = permute(sum(sum(im,1),2), [3 2 1]);

if p.Results.convfact ~= defaultFactor
    FAZarea = FAZpixel*(p.Results.convfact^2);
else
    FAZarea = FAZpixel*(defaultFactor ^2);
end

