
% te retorna o primeiro valor n�o inteiro das solu��es.
% se retornar 0 � por q todas as solu��es s�o inteiras
function [ noINT ] = Verf_Int( M )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
i = 1;
[a,b] = size(M);
noINT = 0;
while(i<=a)
    if(rem(M(i),1)==0)%resto da divis�o por 1
        i = i+1;
    else
        noINT = i;
        break;
    end
end
end

