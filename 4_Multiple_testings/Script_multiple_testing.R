
# Aucune des variables n'est cens�e �tre "diff�rentiellement exprim�e")
# On g�n�re les donn�es sous H0:{mu_1^j - mu_2^j = 0} vs H1:{mu_1^j - mu_2^j != 0}
X = matrix(rnorm(2000000), 200, 10000)
y = rep(1:2, each = 100)

p = apply(X, 2, function(x) t.test(x~y)$p.value)

hist(p)
sum(p<0.05) # <- environ 500 variables (soit 5% de 10000) variables diff�rentiellement exprim�es 

#correction de bonferroni permet de controler le FWER (P(FP>0))
p_bonf = p.adjust(p, method = "bonferroni")
#correction de Benjamini Hochberg permet de controler le FDR (E(FP/P))
p_bonf = p.adjust(p, method = "BH")

#Exercice appliquer une correction de Bonferroni et FDR au donn�es Golub.
