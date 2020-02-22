clc
close all
clear

orig = dir('C:\MAREK\MAGISTERKA\Obrazy\SNRT\ORIG\*.png');

m(1,1) =1;
m(1,2) =2;

% dir2 = 'C:\MAREK\MAGISTERKA\Obrazy\SNRT\VF\';
% dir2 = 'C:\MAREK\MAGISTERKA\Obrazy\SNRT\NLCTV\';
% dir2 = 'C:\MAREK\MAGISTERKA\Obrazy\SNRT\CRIM\';
% dir2 = 'C:\MAREK\MAGISTERKA\Obrazy\SNRT\NLCTVMOD\';
% dir2 = 'C:\MAREK\MAGISTERKA\Obrazy\SNRT\NSTS\';
% dir2 = 'C:\MAREK\MAGISTERKA\Obrazy\SNRT\CRIMSS\';
dir2 = 'C:\MAREK\MAGISTERKA\Obrazy\SNRT\NS\';

for i=1:length(orig)

	clearvars -except i j vfdir vf vf_snr vf_ssim o orig dir2
    orig(i).name
    o = double(imread(['C:\MAREK\MAGISTERKA\Obrazy\SNRT\ORIG\' orig(i).name]));
    
    I = im2double(imread(['C:\MAREK\MAGISTERKA\Obrazy\SNRm\' strrep(orig(i).name,'.','m.')]));
    [nx, ny, nz] = size(I);
    
    mask = double(1-((I(:,:,1) == 0) & ...
                 (    I(:,:,2) == 1)  & ...
                 (    I(:,:,3) == 0)));
             
	min_x = rem(min(find(mask == 0)),nx)+1;
    min_y = floor(min(find(mask == 0))/nx);
     
	max_x = rem(max(find(mask == 0)),nx)+1;
    max_y = floor(max(find(mask == 0))/nx);
    
    vfdir = dir([dir2 '*.png']);

    vf_snr(i).v  = -1;
    vf_snr(i).j  = -1;
    
    vf_ssim(i).v  = -1;
    vf_ssim(i).j  = -1;
    
    for j=1:length(vfdir)
        
        if vfdir(j).name(1:4) == orig(i).name(1:4)
            
            clearvars -except i j vfdir vf vf_snr vf_ssim o orig dir2 min_x min_y max_x max_y
%             vfdir(j).name
            t = double(imread([dir2 vfdir(j).name]));
            if vf_snr(i).v <  snr(o(min_x:max_x,min_y:max_y,:),t(min_x:max_x,min_y:max_y,:))
                vf_snr(i).v = snr(o(min_x:max_x,min_y:max_y,:),t(min_x:max_x,min_y:max_y,:));
                vf_snr(i).j = j;
            end

            if vf_ssim(i).v <  ssim(o(min_x:max_x,min_y:max_y,:),t(min_x:max_x,min_y:max_y,:))
                vf_ssim(i).v = ssim(o(min_x:max_x,min_y:max_y,:),t(min_x:max_x,min_y:max_y,:));
                vf_ssim(i).j = j;
            end

        end
        
    end

end

for i=1:length(orig)
    if vf_ssim(i).j > 0
%         figure
%         imshow(imread([dir2 vfdir(vf_ssim(i).j).name]));
        vfdir(vf_ssim(i).j).name
        vf_ssim(i).v
    end
end

% for i=1:length(orig)
% 	figure
% 	imshow(imread([dir2 vfdir(vf_snr(i).j).name]));
%   vf_snr(i).v
% end