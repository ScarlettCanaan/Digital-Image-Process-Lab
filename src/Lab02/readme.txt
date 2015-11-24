任务1
绘制图像pout.tif的归一化的直方图，要求不使用IPT函数imhist,并与使用imhist的结果进行比较（对比结果图输出）。
1）思路
2）代码
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
3）结果

任务2
	编写程序，对图像pout.tif进行直方图均衡化，最好不使用IPT函数histeq，对均衡化前后的图像以及直方图进行对比。
1）思路
2）代码
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

3）结果

任务3
灰度变换：选择一幅对比度不足的图像，对该图像进行灰度变换,增强对比度，显示增强前、后的图像以及它们的灰度直方图。
1）思路
分析原图像得：图像对比度低主要是由于灰度集中于中部区域，使得整个画面偏灰，因此采用，对中部灰度区域拉伸，加强对比度。
2）代码
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

3）结果

然而在灰阶在40和180取分段线性变换效果并不理想，图像略有失真
任务4
在数字X光医学图像中，每个像素值用12比特表示，但普通显示器的动态范围只有8比特，医生有时需要观察暗区的细节，有时要观察亮区的细节，请你设计一种处理方法，使医生可以自由选择某个灰度范围来观察图像的细节。将设计方案写入实验报告。
1）思路
采用交互式图像处理：
1，输入对图像进行比特平面分层，由用户选择显示哪一层信息。
2，设计如同PS的“色阶”功能的的交互，由用户选择由m位比特到n位比特的输入输出映射。

例如将picturebox控件放在两个panel上，再用两个panel控制输入输出。