clc;

o1 = imread('SNR\SNR1.png');
o2 = imread('SNR\SNR2.png');
o3 = imread('SNR\SNR3.png');
o4 = imread('SNR\SNR4.png');

mr1 = im2double(imread('SNR\SNR1m.png')); [nx1, ny1, nz1] = size(mr1);
mr2 = im2double(imread('SNR\SNR2m.png')); [nx2, ny2, nz2] = size(mr2);
mr3 = im2double(imread('SNR\SNR3m.png')); [nx3, ny3, nz3] = size(mr3);
mr4 = im2double(imread('SNR\SNR4m.png')); [nx4, ny4, nz4] = size(mr4);

m1 = double(1-((mr1(:,:,1) == 0) & ...
             (  mr1(:,:,2) == 1) & ...
             (  mr1(:,:,3) == 0)));
m2 = double(1-((mr2(:,:,1) == 0) & ...
             (  mr2(:,:,2) == 1) & ...
             (  mr2(:,:,3) == 0)));
m3 = double(1-((mr3(:,:,1) == 0) & ...
             (  mr3(:,:,2) == 1) & ...
             (  mr3(:,:,3) == 0)));
m4 = double(1-((mr4(:,:,1) == 0) & ...
             (  mr4(:,:,2) == 1) & ...
             (  mr4(:,:,3) == 0)));
%{
VF1 = imread('C:\MAREK\MAGISTERKA\Obrazy\SNRVFOUT\SNR1m.png_nlmedians_sc4_0.291667_initnone_ps7_10000_conf5_0.1_t61.9696.png');
VF2 = imread('C:\MAREK\MAGISTERKA\Obrazy\SNRVFOUT\SNR2m.png_nlmedians_sc4_0.342105_initnone_ps13_10000_conf5_0.1_t179.196.png');
VF3 = imread('C:\MAREK\MAGISTERKA\Obrazy\SNRVFOUT\SNR3m.png_nlmedians_sc4_0.388889_initnone_ps7_10000_conf5_0.1_t39.101.png');
VF4 = imread('C:\MAREK\MAGISTERKA\Obrazy\SNRVFOUT\SNR4m.png_nlmedians_sc4_0.269231_initnone_ps7_10000_conf5_0.1_t40.5434.png');

NLH1   = imread('C:\MAREK\MAGISTERKA\Obrazy\SNRNLCTV\SNR1m.pngs_r_30p_r9h_2sw_1t_4435.8463.png');
NLH2   = imread('C:\MAREK\MAGISTERKA\Obrazy\SNRNLCTV\SNR2m.pngs_r_30p_r9h_2sw_1t_5517.1994.png');

NLH4   = imread('C:\MAREK\MAGISTERKA\Obrazy\SNRNLCTV\SNR2m.pngs_r_30p_r9h_2sw_1t_5517.1994.png');

NLHSW1 = imread('C:\MAREK\MAGISTERKA\Obrazy\SNRNLCTV\SNR1m.pngs_r_30p_r9h_2sw_3t_24032.2142.png');
NLHSW2 = imread('C:\MAREK\MAGISTERKA\Obrazy\SNRNLCTV\SNR2m.pngs_r_30p_r9h_2sw_3t_28675.7385.png');

NLHSW4 = imread('C:\MAREK\MAGISTERKA\Obrazy\SNRNLCTV\SNR4m.pngs_r_30p_r9h_2sw_3t_25234.4622.png');
%}

min_x1 = rem(min(find(m1 == 0)),nx1)+1;
min_x2 = rem(min(find(m2 == 0)),nx2)+1;
min_x3 = rem(min(find(m3 == 0)),nx3)+1;
min_x4 = rem(min(find(m4 == 0)),nx4)+1;

min_y1 = floor(min(find(m1 == 0))/nx1);
min_y2 = floor(min(find(m2 == 0))/nx2);
min_y3 = floor(min(find(m3 == 0))/nx3);
min_y4 = floor(min(find(m4 == 0))/nx4);

max_x1 = rem(max(find(m1 == 0)),nx1)+1;
max_x2 = rem(max(find(m2 == 0)),nx2)+1;
max_x3 = rem(max(find(m3 == 0)),nx3)+1;
max_x4 = rem(max(find(m4 == 0)),nx4)+1;

max_y1 = floor(max(find(m1 == 0))/nx1);
max_y2 = floor(max(find(m2 == 0))/nx2);
max_y3 = floor(max(find(m3 == 0))/nx3);
max_y4 = floor(max(find(m4 == 0))/nx4);

NSP1 = imread('NSP\t_0.34395_SNR1m.png');
NSP2 = imread('NSP\t_0.35421_SNR2m.png');
NSP3 = imread('NSP\t_0.33791_SNR3m.png');
NSP4 = imread('NSP\t_0.34947_SNR4m.png');

NSTSP1 = imread('NSTSP\ts_0.69063tns_0.37_SNR1m.png');
NSTSP2 = imread('NSTSP\ts_0.52439tns_0.36778_SNR2m.png');
NSTSP3 = imread('NSTSP\ts_0.29951tns_0.32242_SNR3m.png');
NSTSP4 = imread('NSTSP\ts_0.5202tns_0.35048_SNR4m.png');

% o1vf1  = snr (double(o1),double(VF1))
% o1nlh1  = snr (double(o1),double(NLH1))

NSP1S = ssim(double(o1(min_x1:max_x1,min_y1:max_y1,:)),double(NSP1(min_x1:max_x1,min_y1:max_y1,:)))
NSP2S = ssim(double(o2(min_x2:max_x2,min_y2:max_y2,:)),double(NSP2(min_x2:max_x2,min_y2:max_y2,:)))
NSP3S = ssim(double(o3(min_x3:max_x3,min_y3:max_y3,:)),double(NSP3(min_x3:max_x3,min_y3:max_y3,:)))
NSP4S = ssim(double(o4(min_x4:max_x4,min_y4:max_y4,:)),double(NSP4(min_x4:max_x4,min_y4:max_y4,:)))

NSTSP1S = ssim(double(o1(min_x1:max_x1,min_y1:max_y1,:)),double(NSTSP1(min_x1:max_x1,min_y1:max_y1,:)))
NSTSP2S = ssim(double(o2(min_x2:max_x2,min_y2:max_y2,:)),double(NSTSP2(min_x2:max_x2,min_y2:max_y2,:)))
NSTSP3S = ssim(double(o3(min_x3:max_x3,min_y3:max_y3,:)),double(NSTSP3(min_x3:max_x3,min_y3:max_y3,:)))
NSTSP4S = ssim(double(o4(min_x4:max_x4,min_y4:max_y4,:)),double(NSTSP4(min_x4:max_x4,min_y4:max_y4,:)))

%{
vfsnr1  = snr (double(o2),double(VF2))
vfssim1 = ssim(double(o2),double(VF2))

nlhsnr1 = snr (double(o2),double(NLH2))
nlhsim1 = ssim(double(o2),double(NLH2))

vfsnr1  = snr (double(o4),double(VF4))
vfssim1 = ssim(double(o4),double(VF4))

nlhsnr1 = snr (double(o4),double(NLH4))
nlhsim1 = ssim(double(o4),double(NLH4))
%}
