% essa fun��o avalia a condi��o da otmilidade da solu��o, ou seja, se a
% nova solu��o for pior que a melhor solu��o inteira atual ent�o pode parar
% por que se a fracionaria j� esta pior n�o tem como melhorar
function [ out] = Teste3( Zmax, Zatual )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if(Zmax>Zatual)
    out = 1;%o z atual � menor q o Zmax, ou seja j� pode parar.
else
    out = 0;
end
end

