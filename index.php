<?php
/**
 * DOC COMMENT 
 * 
 * PHP Version 7
 * 
 * @category   Document
 * @package    Flatnet3
 * @subpackage NONE
 * @author     Steven Schödel <steven.schoedel@outlook.com>
 * @license    https://www.gnu.org/licenses/gpl-3.0.txt GNU/GPLv3
 * @link       none
 */

/**
 * Läd den Content
 * 
 * @return void
 */
function loadContent()
{
    $valid_pages = array(
        "home" => "includes\pages\home.php", 
        "finanzen" => "includes\pages\finanzen.php",
        "login" => "includes\pages\login.php",
    );
    if (isset($_GET['site'])) {
        $site = $_GET['site'];
        for ($i = 0; $i < sizeof($valid_pages); $i++) {
            if ($valid_pages[$i] == $site) {
                $page = $valid_pages[$i];
            }
        }
    }
    include $valid_pages[$page];
}

?>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/style.css" type="text/css" rel="stylesheet" />
        <title><?php $title ?></title>
    </head>

    <body>
        <div class='mainbody'>
            <div>Menü 
                <a href="./index.php?site=home">Home</a>
                <a href="./index.php?site=login">Login</a>
                <a href="./index.php?site=finanzen">FInanzen</a>
        
            </div>
        </div>
        <div class='mainbody'>
            <?php loadContent(); ?>
        </div>
        <div class='footer'>
        
        </div>
    </body>
</html>
