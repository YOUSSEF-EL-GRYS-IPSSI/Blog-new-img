<?php

require_once 'tools/common.php';

//si un utilisateur est connécté et que l'on reçoit le paramètre "lougout" via URL, on le déconnecte
if(isset($_GET['logout']) && isset($_SESSION['user'])){
	//la fonction unset() détruit une variable ou une partie de tableau. ici on détruit la session user
	unset($_SESSION["user"]);
}

//selection des 3 derniers articles PUBLIés ET dont la publish_date est inférieure ou égale à la date du jour
$query = $db->query('SELECT DISTINCT a.*
	FROM article a JOIN article_category c
	ON a.id = c.article_id
	WHERE a.published_at <= NOW() AND a.is_published = 1
	ORDER BY a.published_at DESC
	LIMIT 3');
$homeArticles=$query->fetchAll();



?>

<!DOCTYPE html>
<html>
	<head>
		<title>Homepage - Mon premier blog !</title>
		<?php require 'partials/head_assets.php'; ?>
	</head>
	<body class="index-body">
		<div class="container-fluid">

			<?php require 'partials/header.php'; ?>

			<div class="row my-3 index-content">

				<?php require 'partials/nav.php'; ?>

				<main class="col-9">
					<section class="latest_articles">
						<header class="mb-4"><h1>Les 3 derniers articles :</h1></header>

						<!-- les trois derniers articles -->

						<?php foreach($homeArticles as $key => $article): ?>
						
						
						<div class="row">
							<h2><?php echo $article['title']; ?></h2>
						<div class="col-sm-4">
						<img class="img-fluid" src="admin/files/<?php echo $article['image']; ?>" alt="">
						</div>
						<div class="col-sm-8">
						<article class="mb-4">
						  <?php 
						     $ids=$article['id'];
							 $query = $db->query('SELECT  c.name as category_name,Ac.*
	                            FROM category c JOIN article_category Ac  WHERE Ac.article_id='.$ids.' and c.id=Ac.category_id ');
                               $homeArticless=$query->fetchAll();
							   foreach($homeArticless as $key => $articles):
						?>
							<strong>[<?= $articles['category_name']; ?>]</strong>
				  <?php endforeach; ?>
							<span class="article-date">
								<!-- affichage de la date de l'article selon le format %A %e %B %Y -->
								<?php echo strftime("%A %e %B %Y", strtotime($article['published_at'])); ?>
							</span>
							<div class="article-content">
								<?php echo $article['summary']; ?>
							</div>
							<a href="article.php?article_id=<?php echo $article['id']; ?>">> Lire l'article</a>
						</article>
						
						</div>
						</div>
						<?php endforeach; ?>

					</section>
					<div class="text-right">
						<a href="article_list.php">> Tous les articles</a>
					</div>
				</main>
			</div>

			<?php require 'partials/footer.php'; ?>

		</div>
	</body>
</html>
