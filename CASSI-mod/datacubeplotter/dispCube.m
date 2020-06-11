function [] = dispCube(datacube,brightness,mywl)

figure;
set(gcf,'color','white');
fig_xpos = 50;
fig_ypos = 50;
fig_width = 820;
fig_height = 860;
set(gcf,'position',[fig_xpos fig_ypos fig_width fig_height]);

wltextposition = [10 size(datacube,2)-15];

imagedatacube2(datacube,brightness,mywl,wltextposition);