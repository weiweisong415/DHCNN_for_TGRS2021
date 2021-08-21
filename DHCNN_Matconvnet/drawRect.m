function [ output_img ] = drawRect( input_img, pt, wSize,  lineSize, color )
%��飺
% %��ͼ��������ɫ�Ŀ�ͼ����������ǻҶ�ͼ����ת��Ϊ��ɫͼ���ٻ���ͼ
% ͼ�����
% ����������  ��  y
% ����������  ��  x
%----------------------------------------------------------------------
%���룺
% input_img��        ԭʼͼ�񣬿���Ϊ�Ҷ�ͼ����Ϊ��ɫͼ
% pt��         ���Ͻ�����   [x1, y1]
% wSize��   ��Ĵ�С      [wx, wy]
% lineSize�� �ߵĿ��
% color��     �ߵ���ɫ      [r,  g,  b] 
%----------------------------------------------------------------------
%�����
% output_img��           �����˵�ͼ��


%flag=1: ��ȱ�ڵĿ�
%flag=2: ��ȱ�ڵĿ�
flag = 2;
%�ж������������
if nargin < 5
    color = [255 255 0];
end
if nargin < 4
    lineSize = 1;
end

[yA, xA, z] = size(input_img);
x1 = pt(1);
y1 = pt(2);
wx = wSize(1);
wy = wSize(2);
%����ǵ�ͨ���ĻҶ�ͼ��ת��3ͨ����ͼ��
if 1==z
    output_img(:, : ,1) = input_img;
    output_img(:, : ,2) = input_img;
    output_img(:, : ,3) = input_img;
else
    output_img = input_img;
end

%��ʼ����ͼ
for c = 1 : 3                 %3��ͨ����r��g��b�ֱ�
    for dl = 1 : lineSize   %�ߵĿ�ȣ���������������չ��
        d = dl - 1;
        if  1==flag %��ȱ�ڵĿ�
            output_img(  y1-d ,            x1:(x1+wx) ,  c  ) =  color(c); %�Ϸ�����
            output_img(  y1+wy+d ,     x1:(x1+wx) , c  ) =  color(c); %�·�����
            output_img(  y1:(y1+wy) ,   x1-d ,           c  ) =  color(c); %������
            output_img(  y1:(y1+wy) ,   x1+wx+d ,    c  ) =  color(c); %������
        elseif 2==flag %��ȱ�ڵĿ�
            output_img(  y1-d ,            (x1-d):(x1+wx+d) ,  c  ) =  color(c); %�Ϸ�����
            output_img(  y1+wy+d ,    (x1-d):(x1+wx+d) ,  c  ) =  color(c); %�·�����
            output_img(  (y1-d):(y1+wy+d) ,   x1-d ,           c  ) =  color(c); %������
            output_img(  (y1-d):(y1+wy+d) ,   x1+wx+d ,    c  ) =  color(c); %������
        end
    end    
end 

end