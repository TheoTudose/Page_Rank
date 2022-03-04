function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare 
   [m n]=size(A);
    Q = A;
    R = zeros( m, n );
    for i = 1 : n
           R( i, i ) = norm( Q( 1 : m, i ) );
       Q( 1 : m, i ) = Q( 1 : m, i ) / R( i, i );
       for j = i + 1 : n
        R( i, j ) = Q( 1 : m, i )' * Q( 1 : m, j );
        Q( 1 : m, j ) = Q(1 : m, j ) - Q( 1 : m, i ) * R( i, j );
       endfor
       
    endfor
 
    I = eye(m,m);
for i = 1 : m
  B(:,i) = linsolve(R,Q'*I(:,i));
endfor

endfunction