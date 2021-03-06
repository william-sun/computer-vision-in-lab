function [means, covarianceinverse] = vl_singlegaussianmodel(descrs)
[dimention, ~] = size(descrs);
id=0;
means=cell(1,dimention+dimention*(dimention+1)/2);
covarianceinverse=cell(1,dimention+dimention*(dimention+1)/2);
for n=1:(dimention-1)
    for m=(n+1):dimention
        fprintf('calculate model %d-%d\n',n,m);
        id=id+1;
        temp=[descrs(n,:);descrs(m,:)];
        means{id}=mean(temp,2);
        sigma=cov(temp')';
        [u,s,v]=svd(sigma);
        
        s=s+eye(2)*(5);
        
        covarianceinverse{id}=v*s^(-1)*u'; 
    end
end
end