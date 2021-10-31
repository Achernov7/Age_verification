<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if (defined('AJAX_REQUEST')) {

        if(isset($_POST["date"])) {

            $Birthday = $_POST['date'];

            $BirthdayUnix = strtotime($Birthday);
            $Birthday = explode("-", $Birthday);

            $age = (date("md", $BirthdayUnix) > date("md")
            ? ((date("Y") - $Birthday[0]) - 1)
            : (date("Y") - $Birthday[0]));

            if ($age>=18) { 

                fn_set_cookie("age1", "dfggergg789we7rt");
                $_COOKIE["age1"]="dfggergg789we7rt";
                $COOKIE=$_COOKIE["age1"];
                echo("18");

            } else {
                
                fn_set_cookie("age1", "fghytuuyjuyk794156h1j");
                $_COOKIE["age1"]="fghytuuyjuyk794156h1j";
                $COOKIE=$_COOKIE["age1"];
                echo("17");    
            }

        }
    } 

    return;

}

$COOKIE = fn_get_cookie('age1');

      
if ($COOKIE !== "dfggergg789we7rt") {  

    Tygh::$app['view']->assign("COOKIE",$COOKIE);
    Tygh::$app['view']->display('addons/ageverificationsite/views/profiles/ageverificationsite.tpl');                          

} 


