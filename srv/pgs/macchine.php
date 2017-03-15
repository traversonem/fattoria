<?php 
	$tbl='macchine';
	$out=Array();
	
	$id = (!empty($_REQUEST['id'])) ? intval($_REQUEST['id']) : false;
	$dt = json_decode(file_get_contents('php://input'));
	if (empty($id) && !empty($dt->id)) $id=intval($dt->id);
	$data=($id) ? R::load($tbl, $id) :  R::dispense($tbl);
	
	if (!empty($dt)) {
			foreach ($dt as $k=>$v){
				$data[$k]=$v;
			}
		try {
			$id=R::store($data);
			$msg='Dati salvati correttamente ('.json_encode($data).') ';
		} catch (RedBeanPHP\RedException\SQL $e) {
			$msg=$e->getMessage();
		}
	}
	
	if (empty($id)) {
		$data=R::find($tbl);
		foreach ($data as $d){
			$d['marca']=$d->marche->marca;
			$out[]=$d;
		}
	}else{
		$out=$data;
	}
	
	sendJson($out);
?>