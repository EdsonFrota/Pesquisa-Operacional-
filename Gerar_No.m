function [ out, Zmax, X ] = Gerar_No( fo,M,V,C,xn,novaRestricao,Zmaxatual, Xotmatual )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%para n�o perder tempo a primeira coisa � verificar a viabilidade, condi��o
%de parada Teste1
%primeiro arrumamos M e V adicionando as novas restri��es
a = 0;
b = Zmaxatual;
c = Xotmatual;

if(xn == 0)

else
    [lin,col] = size(fo);
    i = 1;
    while(i<=col)
        if(i == xn)
            temp(1,i) = 1;
        else
         temp(1,i) = 0;
        end
        i = i+1;
    end
    M = [M;temp]
    if(novaRestricao >=0)
    V = [V;novaRestricao]
    C = [C;-1]
    else
    V = [V;((-1)*novaRestricao)]
    C = [C;1]
    end
    if(Teste1(xn,M,V,novaRestricao))
        disp('Teste1');
    out = 0;%solu��o infactivel
    return %encerra a fun��o
    end
end
%agora avaliar a solu��o simplex
%x = simplex(fo,M,V);
%fo
%V
%M
Ct = C';

x = revised(fo,V',M,Ct,0);
i = Verf_Int(x);%inteiro?
%agora verificamos a condi��o Teste3, se o Zatual � menor q Zmax
Zatl = (fo)*x;
if(Teste3(Zmaxatual,Zatl))
    disp('Teste3');
    out = 0;%o Zatual � menor por isso pode parar, e esta solu��o n�o serve pra nda
    Zmax = Zmaxatual;
    X = Xotmatual;
    return
end
%agora condi��o TS2, se � toda solu��o inteira ou n�o e se vamos criar
%novos n�s ou n�o.

if(i==0)%caso seja solu��o inteira...
    disp('Teste2');
    Zatl = (fo)*x;%como � uma solu��o inteira, ent�o verificamos se � maior q a anterior.
    if(Zatl>Zmaxatual)
        Zmax = Zatl;
        X = x;
        out = 0;
    end
        return
else%caso n�o seja uma solu��o inteira...
    %como n�o � uma solu��o inteira ent�o temos que criar 2 novos n�s.
    %em i temos o valor de qual � o primeiro x da solu��o q n�o � inteiro,
    %por tanto agora vamos achar quais s�o os 2 inteiros mais proximos para
    %cria��o dos novos n�s.
    r = N_Restricao(x(i,1));
    j = 1;
    %x
    b
    c
    %if(xn == 2)
     %   return
    %end
    while(j<=2)%um la�o para cada n�(usando recurs�o)
  
        if (j == 2)
           %C(end,end)= C(end,end)*(-1);
           r(j) = r(j)*(-1);
        end
        [a, b, c] = Gerar_No(fo,M,V,C,i,r(j),b,c); 
        j = j+1;
    end
end
out = a;%concluido com sucesso
Zmax = b;
X = c;
end

