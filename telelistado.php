<?php include_once('header.html') ?>

<?php 
	require 'scripts/db.php';
	
	$sql = $db->prepare('select telecentro.idtelecentro ID,
								CONCAT(personafisica.NOMBRE," ",personafisica.APPATERNO) encargado,
								establecimiento.lat latitud,
								establecimiento.lng longitud,
								estadoimplementacion.nombreestado estado
								from establecimiento,estadoimplementacion,personafisica,telecentro 
								where telecentro.idsupervisor=personafisica.CODPERSONA AND
										telecentro.idestablecimiento=establecimiento.idestablecimiento AND
										telecentro.idestadoimplem=estadoimplementacion.idestadoimplem 
								');
	//$sql->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
//	$statement->execute(array(':name' => "Jimbo"));
	//$row = $statement->fetch(); 
	$sql->execute();
	?>
	
<table id="pattern-style-a" summary="Listado">
<thead>
    	<tr>
			<th scope="col">ID</th>
        	<th scope="col">Encargado</th>
            <th scope="col">Lat</th>
			<th scope="col">Lng</th>
            <th scope="col">Estado</th>
			
        </tr>
  </thead>
  <tbody>
<?php
	echo '<tr>';
	while ($row = $sql->fetch(PDO::FETCH_NUM, PDO::FETCH_ORI_NEXT)) {
      $data = '<td>'.$row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td><td>" . $row[4] . "</td></tr><tr>";
	  print $data;
    }
	echo '</tr>';
?>
</tbody>
</table>

<?php include_once('footer.html') ?>

