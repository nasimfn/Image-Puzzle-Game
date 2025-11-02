clc
clear
close all
[file,path] = uigetfile({'*.jpg';'*.bmp'}, 'FileSelector');
full_adr = [path,file];
im = imread(full_adr);
imr = imresize(im,[300,300]);
imshow(imr);
pause(10);
im1 = imr(1:100,1:100,:);
im2 = imr(1:100,101:200,:);
im3 = imr(1:100,201:300,:);
im4 = imr(101:200,1:100,:);
im5 = imr(101:200,101:200,:);
im6 = imr(101:200,201:300,:);
im7 = imr(201:300,1:100,:);
im8 = imr(201:300,101:200,:);
im9 = imr(201:300,201:300,:);
imp = {im1,im2,im3;im4,im5,im6;im7,im8,im9};
numbers(1:9) = randperm(9);
imp(1:9) = imp(numbers);
imp = cell2mat(imp); 
position = [1 1;1 101;1 201;101 1;101 101;101 201;201 1;201 101;201 201];
value = [1,2,3,4,5,6,7,8,9];
valuec = value;
impf = insertText(imp,position,value,'BoxColor','green');
imshow(impf);
msg = {'Enter first number','Enter second number'};
title = 'Input';
dims = [1 30];
j = 0;
while 1
    pause(2);
    in = inputdlg(msg,title,dims);
    in1 = str2double(in{1,1});
    in2 = str2double(in{2,1});
    po1 = position(in1,:);
    po2 = position(in2,:);
    val1 = value==in1;
    val2 = value==in2;
    i1 = find(val1);
    i2 = find(val2);
    value([i1,i2]) = value([i2,i1]);
    impf1 = impf(po1(2):po1(2)+99,po1(1):po1(1)+99,:);
    impf2 = impf(po2(2):po2(2)+99,po2(1):po2(1)+99,:);
    impf(po1(2):po1(2)+99,po1(1):po1(1)+99,:) = impf2;
    impf(po2(2):po2(2)+99,po2(1):po2(1)+99,:) = impf1;
    j = j+1;
    pause(1);
    imshow(impf);
    po3 = position(str2double(in{1,1}),:);
    po4 = position(str2double(in{2,1}),:); 
    position(str2double(in{1,1}),:) = po4;
    position(str2double(in{2,1}),:) = po3;
    for i = 1:9
        numberc(i) = numbers(value(i));
    end
    if isequal(numberc,valuec)
         msgbox(sprintf('you win :) number of moves=%d',j));
         break;
    end
end    