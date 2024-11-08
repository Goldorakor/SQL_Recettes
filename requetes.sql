question 1 :

SELECT nomRecette, categorie, tempsPrepa
FROM recette
INNER JOIN genre ON recette.idGenre = genre.idGenre
ORDER BY tempsPrepa DESC


question 2 :

SELECT nomRecette, categorie, tempsPrepa, COUNT(composition.idRecette)
FROM recette
INNER JOIN genre ON recette.idGenre = genre.idGenre
INNER JOIN composition ON recette.idRecette = composition.idRecette
GROUP BY composition.idRecette
ORDER BY tempsPrepa DESC


question 3 :

SELECT nomRecette
FROM recette
WHERE tempsPrepa >= 30
ORDER BY tempsPrepa DESC 


question 4 :

les recettes dont le nom contient le mot « patate »
SELECT nomRecette
FROM recette
WHERE nomRecette LIKE '%patate%'


question 5 :

INSERT INTO ingredient (nomIngredient, prixKilo_unite)
 VALUES ('lardons', 10)

puis 

INSERT INTO recette (nomRecette, tempsPrepa, instructions, idGenre)
 VALUES ('pâtes à la carbonara', 20, '', 2)

puis ensuite
INSERT INTO composition (quantiteIngredient, uniteMesure, idRecette, idIngredient)
 VALUES 
(500, 'gramme(s)', 31, 40),
(100, 'gramme(s)', 31, 51),
(3, 'unité(s)', 31, 2),
(5, 'cl', 31, 30),
(2, 'gramme(s)', 31, 36),
(1, 'gramme(s)', 31, 37),
(80, 'gramme(s)', 31, 50);


question 6 :

UPDATE recette
SET nomRecette = 'patate au thym de France'
WHERE idRecette = 3


question 7 :

DELETE FROM recette
WHERE idRecette = 2


question 8 :

pour toutes les recettes
SELECT nomRecette, SUM(quantiteIngredient*prix_gramme_cl_unite)
FROM composition
INNER JOIN ingredient ON composition.idIngredient = ingredient.idIngredient
INNER JOIN recette ON composition.idRecette = recette.idRecette
GROUP BY composition.idRecette

pour la recette n° 18
SELECT nomRecette, SUM(quantiteIngredient*prix_gramme_cl_unite) AS prixTotalRecette
FROM composition
INNER JOIN ingredient ON composition.idIngredient = ingredient.idIngredient
INNER JOIN recette ON composition.idRecette = recette.idRecette
WHERE composition.idRecette = 18


question 9 :

SELECT nomIngredient, quantiteIngredient, (prix_gramme_cl_unite * quantiteIngredient) AS prixParIngredient
FROM composition
INNER JOIN ingredient ON composition.idIngredient = ingredient.idIngredient
WHERE composition.idRecette = 18


question 10 : "unité : cuillère à café" -> pas cette colonne dans la table 'ingredient' mais présente dans la table 'composition'

INSERT INTO ingredient (nomIngredient, prix_gramme_cl_unite)
 VALUES ('poivre vert', 2.5)


question 11 :

UPDATE ingredient
SET prix_gramme_cl_unite = 0.0072
WHERE idIngredient = 12


question 12 : 

SELECT COUNT(recette.idGenre) AS nbRecettes, categorie
FROM recette
INNER JOIN genre ON recette.idGenre = genre.idGenre
GROUP BY recette.idGenre


question 13 : 

Afficher les recettes qui contiennent l’ingrédient « patate »
SELECT nomRecette
FROM recette
INNER JOIN composition ON recette.idRecette = composition.idRecette
WHERE idIngredient = 26


question 14 : 
UPDATE recette
SET tempsPrepa = tempsPrepa -5


question 15 :

Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 0.02 par unité de mesure
(nos myrtilles sont chères par exemple)

Première étape, on récupère toutes les lignes dans la table 'composition' où le prix des ingrédients sont strictement sup à 0.02
On aura parfois certaines recettes avec plusieurs lignes si elles contiennent plusieurs ingrédients chers.
SELECT composition.idRecette
    FROM composition
    INNER JOIN ingredient ON composition.idIngredient = ingredient.idIngredient
    WHERE ingredient.prix_gramme_cl_unite > 0.02
    ORDER BY composition.idRecette (cette ligne pour bien trier par ordre de recettes)



SELECT recette.idRecette, recette.nomRecette
FROM recette
WHERE recette.idRecette NOT IN (
    SELECT composition.idRecette
    FROM composition
    INNER JOIN ingredient ON composition.idIngredient = ingredient.idIngredient
    WHERE ingredient.prix_gramme_cl_unite > 0.02
    ORDER BY composition.idRecette
)
ORDER BY recette.idRecette (cette ligne pour bien trier par ordre de recettes)



question 16 :

ne fonctionne pas : 
SELECT nomRecette, tempsPrepa
FROM recette
WHERE tempsPrepa = MIN(tempsPrepa);

La fonction MIN(tempsPrepa) est une fonction d'agrégation qui doit être utilisée dans une sous-requête pour obtenir une valeur spécifique, ou dans une clause HAVING après un GROUP BY. 
Le WHERE n'accepte pas directement une fonction d'agrégation pour filtrer les lignes individuelles.

fontionne :
SELECT nomRecette, tempsPrepa
FROM recette
WHERE tempsPrepa = (SELECT MIN(tempsPrepa) FROM recette);

ne fonctionne pas : (il faudrait que chaque élément de nomRecette ait plusieurs tempsPrepa différents et alors avec cette requête, on aurait pour chaque élément nomRecette son tempsPrepa minimum parmi tous ses tempsPrepa)
SELECT nomRecette, tempsPrepa
FROM recette
HAVING tempsPrepa = MIN(tempsPrepa);

fonctionne : (on arrive, avec la sous-requête, à récupérer le tempsPrepa minimum de toute la table entière)
SELECT nomRecette, tempsPrepa
FROM recette
GROUP BY nomRecette, tempsPrepa
HAVING tempsPrepa = (SELECT MIN(tempsPrepa) FROM recette);

question 17 :

fonctionne pour une demande de nombres d'ingrédients défini à un entier positif
je rajoute recette.idRecette pour récupérer l'identifiant de la recette pour une vérif perso.
SELECT recette.idRecette, nomRecette, COUNT(nomIngredient)
FROM composition
INNER JOIN recette ON composition.idRecette = recette.idRecette
INNER JOIN ingredient ON composition.idIngredient = ingredient.idIngredient
GROUP BY nomRecette
HAVING COUNT(nomIngredient) <8

présence de NULL -> jointure LEFT ou RIGHT
SELECT recette.idRecette, recette.nomRecette
FROM recette
LEFT JOIN composition ON recette.idRecette = composition.idRecette
WHERE composition.idRecette IS NULL;

réponse 2 si on part de la table composition (tout est inversé)
SELECT recette.idRecette, recette.nomRecette
FROM composition
RIGHT JOIN recette ON composition.idRecette = recette.idRecette
WHERE composition.idRecette IS NULL;


question 18 : 

WHERE ne fonctionne pas, on utilise HAVING
astuce : COUNT sur colonneA, GROUP BY sur colonneA (du bon sens)

SELECT ingredient.nomIngredient, COUNT(composition.idIngredient)
FROM composition
INNER JOIN ingredient ON composition.idIngredient = ingredient.idIngredient
GROUP BY composition.idIngredient
HAVING COUNT(composition.idIngredient) >= 3


question 19 : 

on va ajouter du basilic à la crêpe au sucre : seule la table composition doit être modifiée.
INSERT INTO composition (quantiteIngredient, uniteMesure, idRecette, idIngredient)
 VALUES (2, 'feuille(s)', 15, 20)

 avec idRecette = 15 pour la recette de crêpe au sucre
 avec idIngredient = 20 pour l'ingrédient 'basilic'


question 20 : 

prix des recettes :
SELECT recette.nomRecette, SUM(composition.quantiteIngredient*ingredient.prix_gramme_cl_unite)
FROM composition 
INNER JOIN ingredient ON composition.idIngredient=ingredient.idIngredient
INNER JOIN recette ON composition.idRecette=recette.idRecette
GROUP BY composition.idRecette


prix de la (ou des) recette(s) le plus élevée(s) :
SELECT recette.nomRecette, MAX (SUM(composition.quantiteIngredient*ingredient.prix_gramme_cl_unite))
FROM composition 
INNER JOIN ingredient ON composition.idIngredient=ingredient.idIngredient
INNER JOIN recette ON composition.idRecette=recette.idRecette
GROUP BY composition.idRecette
ORDER BY SUM(composition.quantiteIngredient*ingredient.prix_gramme_cl_unite) DESC





!!!!!!!!!!!!!!!!!!!! ATTENTION !!!!!!!!!!!!!!!!!!!!



JOINTURES EN CASCADE avec des jointures directes 
(on se réfère à la table recette dans nos deux jointures):

SELECT nomRecette, categorie, tempsPrepa, COUNT(composition.idRecette)
FROM recette
INNER JOIN genre ON recette.idGenre = genre.idGenre
INNER JOIN composition ON recette.idRecette = composition.idRecette
GROUP BY composition.idRecette
ORDER BY tempsPrepa DESC;





JOINTURES EN CASCADE avec des jointures indirectes :
(on se réfère à la table précédente à chaque jointure successive):
jointure client-commande
jointure commande-commandeProduit
jointure commandeProduit-produit

SELECT client.nomClient, produit.nomProduit
FROM client client
INNER JOIN commande ON client.idClient = commande.idClient
INNER JOIN commandeProduit ON commande.idCommande = commandeProduit.idCommande
INNER JOIN produit ON commandeProduit.idProduit = produit.idProduit;

on se sert de tables intermédiaires .... 
Commande_Produit est une table associative ?






