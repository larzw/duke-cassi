close all;clear all;clc;

%The following folder has the functions to display the data cube properly
addpath('datacubeplotter');

%Wavelengths (in nm) of the spectral channels in the calibration cube 
load mywl.mat;

%%
%Loading the calibration cube
load('Cu10x1x1x1.mat');
top = 69;right = 450;
Cu = Cu(top:top+255,right-279:right,:);
Cu = Cu/max(Cu(:));

%%
%Loading the CASSI CCD measurement to be processed y
staticscene = 'staticscene1x150.BMP';
staticscenedark = 'staticscenex150xdark.BMP';

y = double(imread(staticscene));
ydark = double(imread(staticscenedark));
y = y-ydark;
y = y.*(y>=0);
y = y(top:top+255,right-279:right,:);
figure;imagesc(y);colormap copper;axis image;colorbar;set(gcf,'color','w');

y = y/max(y(:));

%%
%Regularization parameter
tau = 0.1;

%Number of TwIST main loop iterations
maxiterations = 50;

%%
%Define the functional forms for the Forward and Forward^T models
A = @(x) Rfuntwist(x,Cu);
AT = @(x) RTfuntwist(x,Cu);

%%Preparing to run TwIST
%Number of Chambolle iterations to perform for total variation minimization
piter = 4;

Psi = @(x,th) mycalltoTVnew(x,th,piter);
Phi = @(x) TVnormspectralimaging(x);

tolA = 1e-8;

%%
%Run TwIST
[x_twist_orig,dummy,obj_twist,...
    times_twist,dummy,mse_twist]= ...
    TwISTmod(y,A,tau,...
    'AT', AT, ...
    'Psi', Psi, ...
    'Phi',Phi, ...
    'Initialization',2,...
    'Monotone',1,...
    'StopCriterion',1,...
    'MaxIterA',maxiterations,...
    'ToleranceA',tolA,...
    'Debias',0,...
    'Verbose', 1);

%%
%x_twist is the estimate of the data cube. Prepare it to be displayed as a
%colored cube.
x_twist = flipdim(x_twist_orig,1);

x_twist = x_twist.*(x_twist>=0);
x_twist = x_twist/max(x_twist(:));

x_twist = flipdim(x_twist_orig,1);
temp = shiftCube(x_twist);
x_twist = temp(:,end-247:end,:);
x_twist = x_twist.*(x_twist>=0);
x_twist = x_twist/max(x_twist(:));

%%
%Display the data cube.
dispCube(x_twist,150,mywl);

%Display how the objective function changes over time
figure(1000);
plot(log(obj_twist),'r','LineWidth',2,'LineWidth',2)
legend('TwIST')
st=sprintf('tau = %2.2e',tau),...
    title(st)
ylabel('Obj. function')
xlabel('CPU time (sec)')
grid on
set(gcf,'color','w');