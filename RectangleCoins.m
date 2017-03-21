clc;
close all;
clear;
Img=imread('coin.jpg');
if ndims(Img)==3
I=rgb2gray(Img);
else
I=Img;
end
%
%% lowpass filter
[I,revertclass]=tofloat(I);
PQ=paddedsize(size(I));
[U,V]=dftuv(PQ(1),PQ(2));
D=hypot(U,V);
D0=0.1*PQ(2);
F=fft2(I,PQ(1),PQ(2));
H=lpfilter('ideal',PQ(1),PQ(2),D0,40);%图像匹配 高通滤波 高通滤波+原图像=增强细节

I=dftfilt(I,H);
I=revertclass(I);
figure
imshow(Img);
%% 
I=im2bw(I,graythresh(I));
% I=bwmorph(I,'remove');
I=imfill(I,'holes');
[m,n]=size(I);
% figure
% imshow(I);

L=bwlabel(I);    % 计算连通区域 L矩阵为图像矩阵 同一连通域编号相同
stats=regionprops(L,'all');%计算各个连通域的面积 质心等。。。
set(gcf,'color','w');
set(gca,'units','pixels','Visible','off');
q=get(gca,'position');
q(1)=0;%设置左边距离值为零
q(2)=0;%设置右边距离值为零
set(gca,'position',q);
for i=1:length(stats)
hold on;
rectangle('position',stats(i).BoundingBox,'edgecolor','y','linewidth',2);
temp = stats(i).Centroid;
plot(temp(1),temp(2),'r.');
drawnow;
end
% frame=getframe(gcf,[0,0,n,m]);
% im=frame2im(frame);
% imwrite(im,'a.jpg','jpg');%可以修改保存的格式



