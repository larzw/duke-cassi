function spatialcube = imagedatacube2gray(data,mymax,wavelengths,textposition);

%data = datacube to plot
%mymax = scaling factor to increase brightness of each slice
%wavelengths = wavelengths of each spectral slice in nm
%textposition = where the wavelengths text will be placed

n = size(data,1);
data=mymax*data;

totalfigs = size(data,3);

cols = ceil(sqrt(totalfigs));
rows = ceil(totalfigs/cols);

figscount = 1;
set(gcf,'color','white');

subplot1(rows,cols,'Gap',[0.01 0.01]);
for r = 1:rows
    for c = 1:cols
        if figscount>totalfigs
            subplot1(figscount);axis off;
        else
            currentwl = wavelengths(figscount);

            cmM=(gray*kron(ones(3,1),spectrumRGB(wavelengths(figscount))));
            cmM=cmM/max(max(cmM));

            if figscount<=totalfigs
                subplot1((r-1)*cols+c);
                subimage2(squeeze(data(:,:,figscount)),colormap(cmM));%text(textposition(1),textposition(2),['\bf' num2str(currentwl) ' nm'],'color','w')
                axis off;
            end
        end
        figscount = figscount+1;
    end
end