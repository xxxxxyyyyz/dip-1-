function [img_2] = bilinear(img_1, n)

size_1 = size(img_1);
h_1 = size_1(1);
w_1 = size_1(2);
h_2 = floor(h_1 * n);
w_2 = floor(w_1 * n);
img_2 = zeros(h_2, w_2);
for i=1:h_2
    for j=1:w_2
        a=i/n;
        b=j/n;
        x=a-floor(a);
        y=b-floor(b);%得到小数部分
        if a<1
            a=1;
        end
        if b<1
            b=1;
        end
        if a>=h_1
            a=h_1-1;
        end
        if b>=w_1
            b=w_1-1;
        end    %防止边界溢出
        
        x1=img_1(floor(a),floor(b));
        x2=img_1(floor(a),floor(b)+1);
        x3=img_1(floor(a)+1,floor(b));
        x4=img_1(floor(a)+1,floor(b)+1);%得到邻近四个点的灰度值
        y1=(1-x)*(1-y);
        y2=(1-x)*y;
        y3=x*(1-y);
        y4=x*y; %得到四个点的权值
        img_2(i,j)=x1*y1+x2*y2+x3*y3+x4*y4;
    end
end
img_2=uint8(img_2);
   
end

