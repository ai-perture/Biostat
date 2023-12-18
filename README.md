# Biostat

## 0. Prétraitement des données
0.1. Vous constaterez la présence de données manquantes. En s’appuyant sur la littérature, proposer une
stratégie permettant l’imputation des données manquantes de ce jeu de données.
Dans toute la suite, vous travaillerez sur les données imputées.
    *OK mais ptet plus expliquer la méthode d'imputation MICE cf réf*
    
## 1. Analyse exploratoire des données
1.1. Représenter la distribution de chaque variable explicative conditionnée par la variable diabetes. Observet-on des différences significatives ? En utilisant les tests statistiques qui conviennent (test de student, test du χ2, . . . ), vous justifierez soigneusement vos réponses en vous appuyant sur des critères de p-value ou autre intervalle de confiance.
    *OK je pense (on a montré que pas de distribution normale + distribution significativement différente     entre les neg et les pos)*
    
Dans toute la suite, vous travaillerez sur les données standardisées
1.2. Réaliser une Analyse en Composantes Principales sur l’ensemble des variables explicatives. Interpréterles résultats.
    *Ok je pense*

## 2. Prédiction par régression logistique
2.1. Réaliser une régression logistique permettant de relier la variable diabetes à toutes les facteurs de risque. Reporter les indicateurs de qualité de cette régression logistique. Quels sont les facteurs de risque significativement liés à la variable réponse dans ce modèle ?
Remarque. Vous veillerez à évaluer ce modèle sur une base de test indépendante.

Dans la question suivante, on s’intéresse à une pénalité particulière de type ℓ1 + ℓ2. Afin de comprendre l’impact de cette pénalité dans un modèle logistique, en préambule, on s’intéresse au problème de régression
suivant : blablabla où X est le tableau de variables explicatives et y la variable à expliquer.
2.2. On suppose dans cette question que X⊤X = I. Montrer que : blablabla en sachant que blablabla

2.3. Justifier le caractère parcimonieux qu’induit la pénalité ℓ1 + ℓ2.

2.4. Construire un modèle de régression logistique pénalisée ℓ1 +ℓ2 pour prédire la variable diabetes à partir
de l’ensemble des facteurs de risque. Quelles variables semblent les plus pertinentes ? Reporter les indicateurs
de qualités de cette régression logistique pénalisée ℓ1 + ℓ2.
Remarque 1. Vous veillerez à optimiser les paramètres de ce modèle par cross-validation.
Remarque 2. En utilisant l’argument weights de la fonction glmnet(), il est possible de gérer le déséquilibre
des classes.

2.5. Comparer vos résultats issus de la régression logistique pénalisée ℓ1 + ℓ2 au résultat d’une méthode de
sélection de variables pas-à-pas (step() en R).

2.6. Conclure.
