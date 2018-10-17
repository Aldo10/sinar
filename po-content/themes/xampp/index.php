<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en-US"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en-US"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en-US"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en-US"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en-US"> <!--<![endif]-->
<!--                    _   _                                     _    
  ____   __ _    __ _  (_) | |_    __ _   _ __     __ _   _ __   | | __
 |_  /  / _` |  / _` | | | | __|  / _` | | '_ \   / _` | | '_ \  | |/ /
  / /  | (_| | | (_| | | | | |_  | (_| | | | | | | (_| | | | | | |   < 
 /___|  \__,_|  \__, | |_|  \__|  \__,_| |_| |_|  \__,_| |_| |_| |_|\_\
                |___/                                                  
-->
<head>

	<!-- Your Basic Site Informations -->
	<title><?=$this->e($page_title);?></title>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="robots" content="index, follow" />
    <meta name="description" content="<?=$this->e($page_desc);?>" />
    <meta name="keywords" content="<?=$this->e($page_key);?>" />
    <meta http-equiv="Copyright" content="popojicms" />
    <meta name="author" content="zagitanank" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta name="language" content="Indonesia" />
    <meta name="revisit-after" content="7" />
    <meta name="webcrawlers" content="all" />
    <meta name="rating" content="general" />
    <meta name="spiders" content="all" />
    
    <!-- Social Media Meta -->
	<?php include_once DIR_CON."/component/setting/meta_social.txt";?>
    
    <!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- Stylesheets -->
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<?=$this->asset('/css/font-awesome.min.css');?>" type="text/css" media="all" />
    <link rel="stylesheet" href="<?=$this->asset('/css/gumby.css');?>" type="text/css" media="all" />
    <link rel="stylesheet" href="<?=$this->asset('/css/owl.carousel.css');?>" type="text/css" media="all" />
    <link rel="stylesheet" href="<?=$this->asset('/css/owl.theme.css');?>" type="text/css" media="all" />
    <link rel="stylesheet" href="<?=$this->asset('/css/style.css');?>" type="text/css" media="all" />
    <link rel="stylesheet" href="<?=$this->asset('/css/custom_style.css');?>" type="text/css" media="all" />
    <link rel="stylesheet" href="<?=$this->asset('/css/mediaelementplayer.css');?>" type="text/css" media="all" />
    <link rel="stylesheet" href="<?=$this->asset('/css/responsive.css');?>" type="text/css" media="all" />
    
	<link rel="stylesheet" href="<?=$this->asset('/css/magnific-popup.css')?>" type="text/css" />
   	<!-- Javascript -->
	<script src="https://www.google.com/recaptcha/api.js"></script>
    <script type="text/javascript" src="<?=$this->asset('/js/jquery-1.10.1.min.js')?>"></script>
    <!-- Favicons -->
	<link rel="shortcut icon" href="<?=BASE_URL.'/'.DIR_INC;?>/images/favicon.png" />

</head>
<body class="home page page-id-15 page-parent page-template page-template-home-page page-template-home-page-php">
    <div id="content_nav">
        <div id="nav">
        <?php
            echo $this->menu()->getFrontMenu(WEB_LANG, '', '', '');
        ?>
        </div>
    </div>
    
    <div id="sb-site" class="body_wraper_box">     			
    <!-- Insert Header -->
    <?=$this->insert('header');?>
    <!-- end header, logo, top ads -->
    
    <!-- Content -->
    <div class="row main_content">
         <div class="content_wraper three_columns_container">
         <?=$this->section('content');?>
         </div>
    </div>
    <!-- end content -->


    <!-- Start footer -->
    <footer id="footer-container">
        <?=$this->insert('footer');?>
    </footer>
    <!-- End footer -->
</div>
<div id="go-top"><a href="#go-top"><i class="fa fa-chevron-up"></i></a></div>
	<!-- Javascript -->
    
    <script type="text/javascript" src="<?=$this->asset('/js/plugins.js')?>"></script>
    <script type="text/javascript" src="<?=$this->asset('/js/functions.js')?>"></script>
    <script type='text/javascript' src='<?=$this->asset('/js/marquee.js');?>'></script>
    <script type='text/javascript' src='<?=$this->asset('/js/superfish.js');?>'></script>
    <script type='text/javascript' src='<?=$this->asset('/js/owl.carousel.js');?>'></script>
    <script type='text/javascript' src='<?=$this->asset('/js/jquery.pageslide.min.js');?>'></script>
    <script type='text/javascript' src='<?=$this->asset('/js/mediaelement-and-player.min.js');?>'></script>
    <script type='text/javascript' src='<?=$this->asset('/js/jquery.sticky.js');?>'></script>
    <script type='text/javascript' src='<?=$this->asset('/js/waypoints.min.js');?>'></script>
    <script type='text/javascript' src='<?=$this->asset('/js/jquery.infinitescroll.min.js');?>'></script>
    <script type='text/javascript' src='<?=$this->asset('/js/jquery.slimscroll.min.js');?>'></script>
    <script type='text/javascript' src='<?=$this->asset('/js/jquery.knob.js');?>'></script>
    <script type='text/javascript' src='<?=$this->asset('/js/jquery.bxslider.min.js');?>'></script>
    <script type='text/javascript' src='<?=$this->asset('/js/custom.js');?>'></script>
    
</body>
</html>