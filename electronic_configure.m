% 量子物理2024秋
% 用于电子组态的求解
% 以表格(latex格式)列举微观态，以 d^2 组态为例

l=2; % d 轨道
nelec=2; % 电子数

norb=(2*l+1)*2; % 考虑电子自旋的简并度
A = 1:norb;
C = nchoosek(A,nelec); % 电子排布
Cm=zeros(size(C,1),norb);
for i=1:size(C,1)
    Cm(i,C(i,:))=1;
end

m=l:-1:-l;
morb=repelem(m,2)';
M=Cm*morb;
msorb=repmat([0.5;-0.5],2*l+1,1);
MS=Cm*msorb;
[~,I]=sort(-10*M-MS);
configmat=[M MS];
configmat=configmat(I,:);
Cm=Cm(I,:);

s=[];
for i=1:size(C,1)
    for j=1:2*l+1
        if Cm(i,2*j-1)
            s=[s ' \(\uparrow\)'];
        end
        if Cm(i,2*j)
            s=[s ' \(\downarrow\)'];
        end
        s=[s '&'];
    end
    s=[s sprintf('%d &%d\\\\\n',configmat(i,1),configmat(i,2))];
end
