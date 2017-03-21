function g = dftfilt( f,H,classout )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[f,revertClass]=tofloat(f);
F=fft2(f,size(H,1),size(H,2));
g=ifft2(H.*F);
g=g(1:size(f,1),1:size(f,2));
if nargin==2||strcmp(classout,'original')
    g=revertClass(g);
elseif strcmp(classout,'fltpoint')
    return
else
    error('Undefined class for the output image.')
   

end

