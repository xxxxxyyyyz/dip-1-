function [img_2] = nearest(img_1, n)

size_1 = size(img_1);
h_1 = size_1(1);
w_1 = size_1(2);
h_2 = floor(h_1 * n);
w_2 = floor(w_1 * n);
img_2 = zeros(h_2, w_2);
for i=1:h_2
    for j=1:w_2
        x=round(i/n);
        y=round(j/n);
        if x<1
            x=1;
        end
        if y<1
            y=1;
        end    %��ֹ�߽����
        img_2(i,j)=img_1(x,y);
    end
end
img_2=uint8(img_2);
end


