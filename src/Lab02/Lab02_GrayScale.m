%%%
%
% @version v1.0 2015-10-10
% @author YanMing 1318060039
 
 
close all
clear all
 
%读入图片
source = imread('D:\My Documents\ÏÂÔØ\±ê×¼Í¼Ïñ\±ê×¼Í¼Ïñ\pout.tif');
%转换成灰度图
source = rgb2gray(source);
%imhist(source);
%统计像素灰度
[row,col] = size(source);
for i = 1: 256
    %计算每个灰度在矩阵出现的概率
    P(i) = length(find(source == i-1))/(row*col)
end
 
figure(1);
subplot(1,3,1),imshow(source),title('source');
subplot(1,3,2),bar(P),title('Histogram');
subplot(1,3,3),imhist(source),title('Histogram on API');


%%%
%
% @version v1.0 2015-10-10
% @author YanMing 1318060039
 
close all
clear all
 
%读入图片
source = imread('D:\My Documents\ÏÂÔØ\±ê×¼Í¼Ïñ\±ê×¼Í¼Ïñ\pout.tif');
%转换成灰度图
source = rgb2gray(source);
%imhist(source);
%统计像素灰度
[row,col] = size(source);
for i = 1: 256
    %计算每个灰度在矩阵出现的概率
    P(i) = length(find(source == i-1))/(row*col)
end
%计算累计分布函数
temp(1) = P(1);
for i = 2:256
    temp(i) = temp(i-1) + P(i);
end
 
%累计分布取整
Sk = uint8((255-0)*temp + 0.5);
 
%建立输入输出对应关系
for i = 1:row
    for j = 1:col
     eq(i,j) = Sk(source(i,j));
    end
end

figure;
subplot(2,2,1),imshow(source),title('原图');
subplot(2,2,2),imshow(eq),title('均衡化');
subplot(2,2,3),imhist(source),title('Histogram on API');
subplot(2,2,4),imhist(eq),title('均衡化直方图');

%%%
%
% @version v1.0 2015-10-10
% @author YanMing 1318060039
 
close all
clear all
 
%读入图片
source = imread('H:\作业文档\1.jpg');
%转换成灰度图
source = rgb2gray(source);
imshow(source);
figure;
subplot(1,2,1),imshow(source),title('原图');
subplot(1,2,2),imhist(source),title('Histogram on API');
[row,col] = size(source);

% eq = zeros(row,col);
% 
% for i = 1:row
%     for j = 1:col
%         if source(i,j)<40
%             eq(i,j) = source(i,j)*0.5;
%         elseif source(i,j)>180
%             eq(i,j) = source(i,j)*0.2+174;
%         else
%             eq(i,j) = source(i,j)*2.2-156;
%         end
%     end
% end
%P = mat2gray(eq);
%imshow(P);

Im = histeq(source);
figure;imshow(Im);
imhist(source);