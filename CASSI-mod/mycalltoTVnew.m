function [img_estimated]=mycalltoTVnew(mycube,th,piter)

for i = 1:size(mycube,3)
    x = mycube(:,:,i);
    [uy ux] = size(x);

    dh = @(x) conv2c(x,[1 -1 0]);
    dv = @(x) conv2c(x,[1 -1 0]');
    dht = @(x) conv2c(x,[0 -1 1]);
    dvt = @(x) conv2c(x,[0 -1 1]');
    vect = @(x) x(:);
    opQ = @(x) [vect(dh(x)) vect(dv(x))] ;
    opQt = @(x) dht(reshape(x(:,1),uy,ux))+dvt(reshape(x(:,2),uy,ux));
    
    img_estimated(:,:,i) = x - projk(x,th/2,opQ,opQt,piter);
end