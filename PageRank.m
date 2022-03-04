function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  adj = dlmread(nume, " ");
n = adj(1,1);
val1 = adj(n + 2, 1);
val2 = adj(n + 3, 1);
R1 = Iterative(nume, d, eps);
R2 = Algebraic(nume, d, eps);
name = strcat(nume, '.out');
fis = fopen(name, 'w');
fprintf(fis, "%i\n" , n);
fprintf(fis, "\n");
fprintf (fis, "%f\n", R1);
fprintf(fis, "\n");
fprintf (fis, "%f\n", R2);
fprintf(fis, "\n");
PR = zeros(n,3);
for i = 1 : n
  PR(i,3) = R2(i);
 endfor
 
for i = 1 : n
  PR(i,3) = Apartenenta(PR(i,3),val1,val2);
PR(i,2) = i;
endfor

 PR = sortrows(PR,-3);
 
 for i = 1 : n
   PR(i,1) = i;
 endfor
 
 PR = PR';
fprintf (fis, "%i %i %f\n", PR);
fclose(fis);
endfunction

