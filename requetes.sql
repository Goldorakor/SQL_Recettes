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
