<?php

function smarty_block_render($params, $text, &$smarty)
{
	$text = stripslashes($text);
	$acl = "";

	/* Skip closing tag </render> */	
	if(empty($text)) {
		return("");
	}

	/* Get acl parameter */
	if (isset($params['acl'])) {
		$acl = $params['acl'];
		unset($params['acl']);
	}

	echo "<font color='blue' size='2'>".$acl."</font>";

	/* Read / Write*/
	if(preg_match("/w/i",$acl)){
		return ($text);
	}

	/* Disable objects, but keep those active that have mode=read_active */
	if(!(isset($params['mode']) && $params['mode']=='readable')){

		/* Disable options && greyout divlists */
		$from 	= array("/name=/i" ,		"/list1nohighlight/");
		$to 	= array(" disabled name=",	"list1nohighlightdisabled");
		$text 	= preg_replace($from,$to,$text);

		/* Replace picture if object is disabled */
		if(isset($params['disable_picture'])){
			$syn = "/src=['\"][^\"']*['\"]/i";
			$new = "src=\"".$params['disable_picture']."\"";
			$text = preg_replace($syn,$new,$text);
		}
	}		

	/* Read only */
	if(preg_match("/r/i",$acl)){
		return($text);	
	}

	/* No acls */	
	if(preg_match("/type['\"= ].*submit/",$text)){
		$text = preg_replace("/submit/","button",$text);
	}else{
		$text = preg_replace("/value=['\"][^\"']*['\"]/","",$text);
	}

	/* Remove select options */
	$from 	= array("#<option.*<\/option>#i");
	$to 	= array(" ");
	$text 	= preg_replace($from,$to,$text);

	return $text;
}

?>
