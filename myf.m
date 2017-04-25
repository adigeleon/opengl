function [ area ] = furkan( a,b,c )
a=input('First Number: ');
b=input('Second Number: ');
c=input('Third Number: ');
k = (a+b+c)/2;
area = sqrt(k*(k-a)*(k-b)*(k-c));
fprintf('The Area %d', area);
end
