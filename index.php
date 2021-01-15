<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Micro url</title>
  <meta name="description" content="Enregistrement et raccourcissement de vos url dans une base de donnée">
</head>
<body><pre><?php

  // séparer ses identifiants et les protéger, une bonne habitude à prendre
  include "connect.php";

  try {

    // instancie un objet $connexion à partir de la classe PDO
    $connexion = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET, DB_LOGIN, DB_PASS, DB_OPTIONS);
 
     // Requête de recherche à partir d'un Id
     $requete = "SELECT *
                 FROM `url`
                 WHERE `id_url` = :id_url"; // on cible l'épisode dont l'id est ...
     $prepare = $connexion->prepare($requete);
     $prepare->execute(array(":id_url" => 1)); // on cible l'épisode dont l'id est 2
     $resultat = $prepare->fetchAll();
     print_r([$requete, $resultat]); // debug & vérification


    // Requête d'insertion
    $requete = "INSERT INTO `keyword` (`keyword_name`) 
                     VALUES (:keyword_name);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
        ":keyword_name" => "linkedin"
    ));
    $resultat = $prepare->rowCount(); // rowCount() nécessite PDO::MYSQL_ATTR_FOUND_ROWS => true
    $lastInsertedKeywordId = $connexion->lastInsertId(); // on récupère l'id automatiquement créé par SQL
    print_r([$requete, $resultat, $lastInsertedKeywordId]); // debug & vérification

    // Requête de modification
    $requete = "UPDATE `keyword`
            SET `keyword_name` = :keyword_name
            WHERE `id_keyword` = :id_keyword;";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
        ":id_keyword"   => $lastInsertedKeywordId,
        ":keyword_name" => "LinkedIn"
    ));
    print_r($requete); // debug & vérification

    // Requête de suppression
    $requete = "DELETE FROM keyword
    WHERE (id_keyword = :id_keyword);";
    $prepare = $connexion->prepare($requete); //préparation de la requete et connexion à la base de donnée 
    $prepare->execute(array($lastInsertedKeywordId)); // Après préparation de la requete, on l'execute
    $resultat = $prepare->rowCount(); //Retourne le nombre de ligne affectée par la requete effectuée
    print_r([$requete, $resultat, $lastInsertedKeywordId]); //Affiche la requete, le resultat de la requete et la variable $lasInsertedKeywordId

    //Requete qui ajoute une entrée dans la table url
    $requete = "INSERT INTO `url` (`url`, `shortcut`, `datetime`, `description`)
                VALUES (:url, :shortcut, :datetime, :description);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
       ":url" => "https://www.zataz.com/total-energie-direct-obligee-de-stopper-un-jeu-en-ligne-suite-a-une-fuite-de-donnees/",
       ":shortcut" => "ztz7",
       ":datetime" => "2021-01_15",
       ":description" => "L'entreprise Total Energie Direct avait lancé un jeu en ligne. Le concours a dû être stoppé. Il était possible d'accéder aux données des autres joueurs."
    ));
    print_r($requete);

    //Requete qui ajoute piratage dans la table 'keyword'
    $requete = "INSERT INTO `keyword` (`keyword_name`)
                 VALUES (:keyword_name);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
       ":keyword_name" => "piratage"
    ));
    print_r($requete);

    //Requête qui lie le keyword "piratage" à l'url de l'étape 7
    $requete = "INSERT INTO `assoc_url_keyword` (`id_assoc_url`, `id_assoc_keyword`)
                VALUES (:id_assoc_url, :id_assoc_keyword);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
       ":id_assoc_url" => 8,
       "id_assoc_keyword" => 19
    ));
    print_r($requete);

    //Pour aller plus loin jointure entre piratage et url associer
    $requete = "SELECT 
    keyword_name,
    url
    FROM assoc_url_keyword
    JOIN keyword ON id_keyword = id_assoc_keyword
    JOIN url ON id_url = id_assoc_url
    WHERE id_keyword = 19;";
    $prepare = $connexion->prepare($requete);
    $prepare->execute();
    $resultat = $prepare->fetchAll();
    print_r([$requete, $resultat]);

  } catch (PDOException $e) {

    // en cas d'erreur, on récup et on affiche, grâce à notre try/catch
    exit("❌🙀💀 OOPS :\n" . $e->getMessage());

  }

?></pre></body>
