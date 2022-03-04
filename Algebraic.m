function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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

I = eye(n,n);

A = I - d * M;

A = PR_Inv(A);
I = ones(n,1);
R = A * (( 1 - d) * I / n );

endfunction 