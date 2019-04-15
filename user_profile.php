
<?php require_once 'tools/common.php';

if(!isset($_SESSION['user']['id']) OR $_SESSION['user']['is_admin'] == 0){
	
//Si $_POST['update'] existe, cela signifie que c'est une mise à jour d'utilisateur
if(!empty($_POST['update'])){

if(empty($_POST['firstname']) OR empty($_POST['email'])){
   
          $loginError= "Merci de remplir tous les champs obligatoire *";
   }
   Else{
   //uniquement si l'utilisateur souhaite modifier le mot de passe
    if(!empty($_POST['password']) and  empty(!$_POST['password_confirm'])) {
	   
	     if($_POST['password']!=$_POST['password_confirm']) {
	       //ici on teste si les mots de passe renseignés sont identiques
	       $loginError= "Les mots de passe ne sont pas identiques";
         }
		 Else{
		
		    $passwords=hash('md5',$_POST['password']);
	       //début de la chaîne de caractères de la requête de mise à jour
	       $queryString = 'UPDATE user SET firstname=:firstname,lastname=:lastname,email=:email,bio=:bio,password=:password WHERE id=:id';
	      //début du tableau de paramètres de la requête de mise à jour
			$queryParameters=[ 
				'firstname'=>$_POST['firstname'], 
				'lastname'=>$_POST['lastname'], 
				'email'=>$_POST['email'], 
				'bio'=>$_POST['bio'], 
				'password'=>$passwords, 
				'id' =>$_POST['id']
			];
			//préparation et execution de la requête avec la chaîne de caractères et le tableau de données
			$query=$db->prepare($queryString);
			$result=$query->execute($queryParameters);
			if($result){
				$loginError= "Mise à jour des informations éffectuées  et le mot aussi a été modifie *";
				
			}
			else{
				 $loginError= "Mise à jour des informations non éffectuées , veuillez réessayez";
			}	
			
		 }
	}
	Else{
		
		 //début de la chaîne de caractères de la requête de mise à jour
	       $queryString = 'UPDATE user SET firstname=:firstname,lastname=:lastname,email=:email,bio=:bio WHERE id=:id';
	      //début du tableau de paramètres de la requête de mise à jour
			$queryParameters=[ 
				'firstname'=>$_POST['firstname'], 
				'lastname'=>$_POST['lastname'], 
				'email'=>$_POST['email'], 
				'bio'=>$_POST['bio'], 
				'id' =>$_POST['id']
			];
			//préparation et execution de la requête avec la chaîne de caractères et le tableau de données
			$query=$db->prepare($queryString);
			$result=$query->execute($queryParameters);
			if($result){
				$loginError= "Mise à jour des informations éffectuées   *";
				
			}
			else{
				 $loginError = "Mise à jour des informations non éffectuées , veuillez réessayez ";

			}
			}


}
}

//si on modifie un utilisateur, on doit séléctionner l'utilisateur en question (id envoyé dans URL) pour pré-remplir le formulaire plus bas
if(isset($_SESSION['user']['id'])){
	$query = $db->prepare('SELECT * FROM user WHERE id = ?');
    $query->execute(array($_SESSION['user']['id']));
	//$user contiendra les informations de l'utilisateur dont l'id a été envoyé en paramètre d'URL
	$user = $query->fetch();
}
}

?>
<!DOCTYPE html>
<html>
<head>

    <title><?php if(isset($_SESSION['user']['firstname'])){ echo $_SESSION['user']['firstname']; }?> - Mon premier blog !</title>
    <?php require 'partials/head_assets.php'; ?>

</head>
<body class="article-body">
<div class="container-fluid">

    <header class="row mb-3 main-header">
        <div class="col py-4 text-center">
            <a href="index.php"><b>Mon premier blog !</b></a>
            <p>Sunday  7 April 2019</p>
        </div>
    </header>
    <div class="row my-3 article-content">
                <?php require 'partials/nav.php'; ?>
        </nav>

        <main class="col-9">
            <form action="user_profile.php" method="post" class="p-4 row flex-column">

                <h4 class="pb-4 col-sm-8 offset-sm-2">Mise à jour des informations utilisateur</h4>
				
				   <?php if(isset($loginError)): ?>
							<div class="text-danger col-sm-8 offset-sm-2 mb-4"><?php echo $loginError; ?></div>
							<?php endif; ?>


                <div class="form-group col-sm-8 offset-sm-2">
                    <label for="firstname">Prénom <b class="text-danger">*</b></label>
                    <input class="form-control" value="<?= isset($user) ? htmlentities($user['firstname']) : '';?>" type="text" placeholder="Prénom" name="firstname" id="firstname" />
                </div>
                <div class="form-group col-sm-8 offset-sm-2">
                    <label for="lastname">Nom de famille</label>
                    <input class="form-control"  value="<?= isset($user) ? htmlentities($user['lastname']) : '';?>" type="text" placeholder="Nom de famille" name="lastname" id="lastname" />
                </div>
                <div class="form-group col-sm-8 offset-sm-2">
                    <label for="email">Email <b class="text-danger">*</b></label>
                    <input class="form-control" value="<?= isset($user) ? htmlentities($user['email']) : '';?>" type="email" placeholder="Email" name="email" id="email" />
                </div>
                <div class="form-group col-sm-8 offset-sm-2">
                    <label for="password">Mot de passe (uniquement si vous souhaitez modifier votre mot de passe actuel)</label>
                    <input class="form-control" value="" type="password" placeholder="Mot de passe" name="password" id="password" />
                </div>
                <div class="form-group col-sm-8 offset-sm-2">
                    <label for="password_confirm">Confirmation du mot de passe (uniquement si vous souhaitez modifier votre mot de passe actuel)</label>
                    <input class="form-control" value="" type="password" placeholder="Confirmation du mot de passe" name="password_confirm" id="password_confirm" />
                </div>
                <div class="form-group col-sm-8 offset-sm-2">
                    <label for="bio">Biographie</label>
                    <textarea class="form-control" name="bio" id="bio"  placeholder="Ta vie Ton oeuvre..."> <?= isset($user) ? htmlentities($user['bio']) : '';?></textarea>
                </div>
				
				    	<?php if(isset($user)): ?>
						<input type="hidden" name="id" value="<?= $user['id']?>" />
						<?php endif; ?>

                <div class="text-right col-sm-8 offset-sm-2">
                    <p class="text-danger">* champs requis</p>
                    <input class="btn btn-success" type="submit" name="update" value="Valider" />
                </div>

            </form>
        </main>
    </div>

    <?php require 'partials/footer.php'; ?>

</div>
</body>
</html>