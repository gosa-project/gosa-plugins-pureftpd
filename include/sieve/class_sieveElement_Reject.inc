<?php

class sieve_reject 
{
  var $data = array();
  var $object_id = -1;


  function save_object()
  {
    if(isset($_POST['reject_message_'.$this->object_id])){
      $msg = stripslashes($_POST['reject_message_'.$this->object_id]);

      $this->data = $msg;
    }
  }

  function check()
  {
    return(array());
  }

  function sieve_reject($data,$object_id)
  {
    $this->object_id = $object_id;
    $str = "";
    foreach($data['ELEMENTS'] as $node ){
      if(in_array($node['class'],array("quoted-string","text","multi-line"))){

        if($node['class'] == "multi-line"){
          $str .= preg_replace("/^text:[ \n\r]*/","",$node['text']);
          $str =  preg_replace("/[  \n\r]*\.[  \n\r]*$/","",$str);
        }else{
          $str .= $node['text'];
        }
      }
    }
    $this->data = preg_replace("/\"/","",$str);
  }

  function get_sieve_script_part()
  {
    return("reject ".sieve_create_strings($this->data).";\n");
  } 
    
  function execute()
  {
    /* check if this will be a 
     *   - single string ""
     *   - or a multi line text: ... ; 
     */
    $Multiline = preg_match("/\n/",$this->data);

    $smarty = get_smarty();
    $smarty->assign("ID", $this->object_id);
    $smarty->assign("Message",$this->data);
    $smarty->assign("Multiline",$Multiline);
    $object_container = $smarty->fetch(get_template_path("templates/object_container.tpl",TRUE,dirname(__FILE__)));
    $object= $smarty->fetch(get_template_path("templates/element_reject.tpl",TRUE,dirname(__FILE__)));
    $str = preg_replace("/%%OBJECT_CONTENT%%/",$object,$object_container);
    return($str);
  }
}

