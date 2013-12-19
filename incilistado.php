<?php include_once('header.html') ?>

<?php 
	require 'scripts/db.php';
	
	$sql = $db->prepare('select * from areaincidencia');
	//$sql->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
//	$statement->execute(array(':name' => "Jimbo"));
	//$row = $statement->fetch(); 
	$sql->execute();
	?>
	
<table id="pattern-style-a" summary="Meeting Results">
<thead>
    	<tr>
        	<th scope="col">ID Area</th>
            <th scope="col">Nombre area</th>
        </tr>
  </thead>
  <tbody>
<?php
	echo '<tr>';
	while ($row = $sql->fetch(PDO::FETCH_NUM, PDO::FETCH_ORI_NEXT)) {
      $data = '<td>'.$row[0] . "</td><td>" . $row[1] . "</td></tr><tr>";
	  print $data;
    }
	echo '</tr>';
?>
</tbody>
</table>

<?php include_once('footer.html') ?>

