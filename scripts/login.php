<?php 
	header('Content-Type: application/json');
	$u =  isset($_GET['usuario']) ? $_GET['usuario'] : '';
	$p = isset($_GET['password']) ? $_GET['password'] : '';
	
	$arr = array('usuarioID' => 1,'nick'=> 'admin' ,'password' => '1234');
	
	if ($arr['nick']==$u) {
		echo json_encode($arr);
	} else {
		echo "{}";
	}
	
?>