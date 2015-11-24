任务1
实现图像Baboon.bmp（MATLAB自带）的读入（可使用imread）和显示（可使用imshow）操作，代码加上足够的注释，需要建立一个M文件实现。
1）思路
2）代码
%%%
%
%
%@version v1.0 2015-09-24
%@author YanMing 1318060039


%% func2: 读入并显示Baboon.bmp
function func1(arg)
    source = imread('D:\My Documents\下载\标准图像\标准图像\Baboon.bmp');
    im_gray = rgb2gray(source);
    figure(1);
    subplot(1,2,1),imshow(source),title('source');
    subplot(1,2,2),imshow(im_gray),title('gray');
end
3）结果

4）结果分析
函数rgb2gray()将RGB图像转化为灰度图像
任务2
编程实现将一幅RGB图像转换为二值图像，并在一个窗口同时显示处理过程中得到的每一个图像和原图像，同时需要给图像加上标题。（原始数据可以是任意的RGB图像）。需要新建一个M文件实现。
1）思路
2）代码
%% func2: 将一幅RGB图像转化为二值图像并显示
function func2()
    source = imread('D:\My Documents\下载\标准图像\标准图像\Baboon.bmp');
	im_Binary = im2bw(source,0.5);
	figure(1);
    subplot(1,2,1),imshow(source),title('source');
    subplot(1,2,2),imshow(im_Binary),title('Binary');
end
3）结果

4）结果分析
函数imshow()将图片做二值化处理，其参数level用来指定二值化分离的阈值。
顺带一提求解最优二值化的算法有Isodata Algorithm、OTSU Algorithm、Frequency and Mean Value Algorithm、Entropy Method等等，主要思路是根据直方图的双峰性，找到区分前景与背景的两个峰值的叠加区。
任务3
计算图象统计参数：
读取图像（文件名为‘cameraman.tif’）;
最大值
最小值
均值
1）思路
2）代码
%% func3: 计算图像统计参数
function func3()
	source = imread('D:\My Documents\下载\标准图像\标准图像\Baboon.bmp');
	maxPixel = max(source);
    minPixel = min(source);
    meanPixel = mean(source);
end
3）结果

4）结果分析
Max(A)、Min(A)、Mean(A)为找出矩阵每列的最大值、最小值、均值
Max(A,B)为返回两个维数相等的矩阵每列最大值
任务4
利用帮助系统了解im2double,imresize,image函数的作用和语法，并利用这些函数处理已知图像pout.tif（MATLAB自带）并显示处理前后效果。
1）思路
2）代码
%% func4: 调用im2double/imresize/image
function func4()
	source = imread('D:\My Documents\下载\标准图像\标准图像\Baboon.bmp');	
	figure();
    subplot(2,2,1),image(source),title('source');
    im_double = im2double(source);
    im_resize = imresize(source,5,'nearest'); %邻近插值算法
    subplot(2,2,2),image(im_double),title('double');
    subplot(2,2,3),image(im_resize),title('resize');
    %subplot(2,2,4),image(source),title('image');
    imwrite(im_double,'Baboon_double.bmp');
    imwrite(im_resize,'Baboon_resize.bmp');
End
3）结果

4）结果分析
Image()与imshow()都是显示图像，从实验结果分析观察有几处不同：
1，imshow()按照原图的像素大小比例显示，image()按照坐标轴的大小来显示，由于坐标轴需要平铺工作区，所以显示图像在比例上会有一定失真
2，image()显示图片带有坐标轴，在显示原图和比例缩放后的图显示更明显
3，image()可以显示double型数据