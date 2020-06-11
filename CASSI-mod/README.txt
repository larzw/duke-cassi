Contents of the zip file (sorted by name)

datacubeplotter: folder that contains code to display a colorized version of the data cube
conv2c.m = function that implements circular convolution
Cu10x1x1x1.mat = MATLAB data file contain calibration data from CASSI
diffh.m = computes the horizontal gradient of an image
diffv.m = computes the vertical gradient of an image
digitalcamerapicture2.jpg = picture of the scene from a Canon digital camera
mycalltoTVnew.m = minimizes the total variation of each spectral slice in the data cube by calling projk.m
mywl.mat = vector storing the wavelengths of the spectral channels in the data cube
projk.m = implements Chambolle's algorithm for total variation minimization of an image
Rfuntwist.m = implements the CASSI forward model
RTfuntwist.m = implements the transpose of the forward model
RUNME.m = The main script to generate a data cube from CASSI raw data
shiftCube.m = performs an unshifting operation on the data cube estimated by TwIST to remove effect of
              dispersion
staticscene1x150.BMP = raw CASSI data of the scene
staticscenex150xdark.BMP = dark image from CASSI
TVnormspectralimaging.m = computes the TV of the data cube
TwISTmod.m = the TwIST algorithm used to estimate the data cube from the CASSI data