function y = Rfuntwist(f,C)

n1 = size(C,1);
n2 = size(C,2);
m = size(C,3);

% h = ones(1);

%reshape f to have a shape of a cube
f = reshape(f,[n1,n2,m]);

%'punch' each slice in cube with the code C. The shearing is already
%captured in the calibration cube that is passed in to the function as C.
gp = f.*C;

%simulate 'smash' on the CCD
y = sum(gp,3);