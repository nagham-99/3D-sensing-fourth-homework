function [ TR,TT,source ] = icp( model,source,ErrVal )


m=size(model,1); 
M=size(model,2);  
N=size(source,2); 

TR=eye(m);  
TT=zeros(m,1); 

vi=zeros(size(source,2)); 
Err1=100; 
while 1   
    for i=1:1:N   
    minval=9e99;
    for j=1:1:M
        val=norm(source(:,i)-model(:,j));
                    if val<minval
                        minval=val;
                        vi(i)=j; 
                    end
    end
    end

Cs=mean(source,2); 
Cm=mean(model,2);  
source1=zeros(size(source,1),size(source,2)); 
p1=zeros(size(source,1),size(source,2)); 
for i=1:1:N
    source1(:,i)=source(:,i)-Cs; 
    p1(:,i)=model(:,vi(i))-Cm;  
end

H=source1*p1'; 
[U,D,V]=svd(H); 

R=V*U';  
T=Cm-R*Cs; 


TR=R*TR;
TT=R*TT+T;

source=R*source; 


for i=1:1:m
        source(i,:)=source(i,:)+T(i);
end


Err=0;
for i=1:1:N
    Err=Err+norm(model(:,vi(i))-source(:,i));
end


if abs(Err1-Err/N)<ErrVal
    break;
else
    Err1=Err/N;
end
end

end

