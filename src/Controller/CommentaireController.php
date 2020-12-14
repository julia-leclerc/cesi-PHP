<?php

namespace src\Controller;

use PDOException;
use Exception;
use src\Model\Article;
use src\Model\Commentaire;
use src\Model\BDD;
use Twig\Error\LoaderError;
use Twig\Error\SyntaxError;
use Twig\Error\RuntimeError;

class CommentaireController extends AbstractController
{
    /**
     * Add ajoute un nouveau commentaire
     * @param string $id L'id de l'article parent
     */
    public function Add(string $id)
    {
        /** Récupère un article avec son ID */
        $article = (new Article)->SqlGetById(BDD::getInstance(), $id);
        if ($article == false) {
            throw new \Exception('The provided ID does not refer to an article');
        }

        if ($_POST) {
            $commentaire = new Commentaire();
            $commentaire->setTexte($_POST["texte"]);
            $commentaire->setAuteur($_POST["auteur"]);
            $commentaire->setMail($_POST["mail"]);
            $commentaire->setArticleId($article->getId());

            $commentaire->SqlAdd(BDD::getInstance());

            header("Location: /Article/Show/{$commentaire->getArticleId()}");
        } else {
            return $this->twig->render("Commentaire/form.html.twig", [
                'article' => $article,
            ]);
        }
    }

    public function Delete($id)
    {
        $commentaires = new Commentaire();

        $commentaire = $commentaires->SqlGetById(BDD::getInstance(), $id);
        $datas = $commentaires->SqlDeleteById(BDD::getInstance(), $id);

        header("Location: /Article/Show/{$commentaire->getArticleId()}");
    }

    public function Update($id)
    {
        $commentaires = new Commentaire();
        /** @var Commentaire $commentaire */
        $commentaire = $commentaires->SqlGetById(BDD::getInstance(), $id);
        $article = (new Article)->SqlGetById(BDD::getInstance(), $commentaire->getArticleId());

        if ($_POST) {
            $commentaire->setTexte($_POST["texte"]);
            $commentaire->setAuteur($_POST["auteur"]);
            $commentaire->setMail($_POST["mail"]);
            $result = $commentaire->SqlUpdate(BDD::getInstance());

            header("Location: /Article/Show/{$commentaire->getArticleId()}");
        } else {
            return $this->twig->render("Commentaire/form.html.twig", [
                "commentaire" => $commentaire,
                "article" => $article,
            ]);
        }
    }
}