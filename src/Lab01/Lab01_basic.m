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

%% func2: 将一幅RGB图像转化为二值图像并显示
function func2()
    source = imread('D:\My Documents\下载\标准图像\标准图像\Baboon.bmp');
	im_Binary = im2bw(source,0.5);
	figure(1);
    subplot(1,2,1),imshow(source),title('source');
    subplot(1,2,2),imshow(im_Binary),title('Binary');
end

%% func3: 计算图像统计参数
function func3()
	source = imread('D:\My Documents\下载\标准图像\标准图像\Baboon.bmp');
	maxPixel = max(source);
    minPixel = min(source);
    meanPixel = mean(source);
end

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