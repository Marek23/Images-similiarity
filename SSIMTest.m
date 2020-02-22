clc;

o1 = imread('C:\MAREK\MAGISTERKA\Obrazy\SNR\SNR1.png');
o2 = imread('C:\MAREK\MAGISTERKA\Obrazy\SNR\SNR2.png');
o3 = imread('C:\MAREK\MAGISTERKA\Obrazy\SNR\SNR3.png');
o4 = imread('C:\MAREK\MAGISTERKA\Obrazy\SNR\SNR4.png');

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

o1vf1  = snr (double(o1),double(VF1))
o1vf1s = ssim(double(o1),double(VF1))

o1nlh1  = snr (double(o1),double(NLH1))
o1nlh1s = ssim(double(o1),double(NLH1))

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
