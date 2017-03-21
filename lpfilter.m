function H = lpfilter(type,M,N,D0,n)

%UNTITLED Summary of this function goes here

%   Detailed ex,planation goes here

[U,V]=dftuv(M,N);
D=hypot(U,V);

switch type
    
case 'ideal'
        
H=single(D<=D0);
    
case 'btw'
       
 if nargin==4
           
 n=1;
       
 end
       
 H=1./(1+(D./D0).^(2*n));
    
case 'gaussian'
        
H=exp(-(D.^2)./(2*(D0^2)));
   
 otherwise
        
error('unknown filter type.')

end


end

