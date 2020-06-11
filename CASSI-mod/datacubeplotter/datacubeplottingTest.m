close all;clear all;clc;

load mywl;          %Loads the wavelength matrix

testmatrix = ones(256,256,33);      %Load the datacube

brightness = 100;                   %Set the brightness of the datacube

dispCubeAshwin(testmatrix,brightness,mywl)      %Plot the datacube