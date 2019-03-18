function [img_2] = bicubic(img_1, n)

size_1 = size(img_1);
h_1 = size_1(1);
w_1 = size_1(2);
h_2 = floor(h_1 * n);
w_2 = floor(w_1 * n);
img_2 = zeros(h_2, w_2);
pix=zeros(4,4);%临近16个点的灰度值矩阵
value=zeros(4,4);%临近点对应权值
for i=1:h_2
    for j=1:w_2
        a=i/n;
        b=j/n;
        x=a-floor(a);
        y=b-floor(b);%得到小数部分
         if a<2
            a=2;
        end
        if b<2
            b=2;
        end
   if a>=h_1-2
            a=h_1-2;
        end
        if b>=w_1-2
            b=w_1-2;
        end      %防止边界溢出
   for k=1:4
       for m=1:4;
           pix(k,m)=img_1(floor(a)-2+k,floor(b)-2+m);
       end
   end   %得到邻近点灰度值
  d=[W(1+x) W(x) W(1-x) W(2-x);W(1+y) W(y) W(1-y) W(2-y)];
   for k=1:4
     for m=1:4
         value(k,m)=d(1,k)*d(2,m);
     end
   end    %得到邻近点权值
   img_2(i,j)=sum(sum(pix.*value));
    end
end
   function z=W(t) %函数取值
   q=-0.5;   
   if t<=1
       z=(q+2)*t^3-(q+3)*t^2+1;
   else if t<2
           z=q*t^3-5*q*t^2+8*q*t-4*q;
       else z=0;
       end
   end
   end
    img_2=uint8(img_2);      
end
