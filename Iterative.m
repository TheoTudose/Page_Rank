function copyR = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  adj = dlmread(nume, " ");
n = adj(1,1);
M = zeros(n,n);
K = M;
adjinv = K;


for i=2:n+1
  contor = adj(i,2);
  parsor = 3;

  while contor > 0

  if adj(i, parsor) != 0
      adjinv((i - 1), adj(i, parsor)) = 1;
    endif
    parsor ++;
    contor --;

    endwhile

    endfor

for i=1:n
  adjinv(i, i) = 0;
endfor


for i=1:n
  K(i, i) = adj(i + 1, 2);
endfor

invofK = inv(K);
M_t = invofK * adjinv;
M = M_t';
R = zeros(n,1);
for i = 1:n
  R(i,1) = 1/n;
endfor

copyR = R;

I = ones(n, 1);
while 1
  R = d * M * copyR + ((1 - d)/n) * I;
  tol = norm(R - copyR);
  if (tol < eps)
    return;
  endif
   copyR = R;
endwhile


endfunction