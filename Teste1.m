%INPUT:
% - xn � a solu��o xn que est� sendo analisada, por exemplo x2 ent�o xn = 2
% - M: matriz das constantes das inequa��es
% - V: vetor das desigualdades
% - novaRestricao: � o valor da restri��o adicionada, sempre vai ser um
% inteiro, se for positiva o algoritmo vai entender como uma restri��o de
% <=X se for negativo o algoritmo vai entender como >=X
%OUTPUT:
% - 1 significa que o criterio de parada Teste1 foi identificado, ou seja,
% solu��o n�o viavel
% - 0 significa que o criterio de parada n�o foi satisfeito.



function [ out ] = Teste1( xn, M, V, novaRestricao)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% Detectando a infactibilidade desta solu��o
%para isso vou verificar as restri��es
[a,b] = size(M);
i = 1;
if(novaRestricao>=0)
    while(i<=a)%percorrer as linhas
        if(M(i,xn)*novaRestricao<=V(i,1))%verifica se as restri��es est�o sendo atendidas
            out = 0; % as restri��es est�o sendo atendidas
        else
            out = 1; % uma das restri��es n�o foi atendida, ou seja a solu��o � infactivel
            break;
        end
        i = i+1;
    end
end
if(novaRestricao<0)
    while(i<=a)%percorrer as linhas
        if(M(i,xn)*(novaRestricao*(-1))<=V(i,1))%verifica se as restri��es est�o sendo atendidas
            out = 0; % as restri��es est�o sendo atendidas
        else
            out = 1; % uma das restri��es n�o foi atendida, ou seja a solu��o � infactivel
            break;
        end
        i = i+1;
    end
end
    
end

