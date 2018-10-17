<header class="header-wraper">
            <div class="header_top_wrapper">
                <div class="row">
                    <div class="six columns header-top-left-bar">
                        <div class="news_ticker_wrapper">
                            <div class="row">
                                <div class="twelve columns">
                                    <div id="ticker">
                                        <div class="tickerfloat_wrapper">
                                            <div class="tickerfloat">
                                                <?=$this->e($front_breaking_news);?>
                                            </div>
                                        </div>


                                        <div class="marquee" id="mycrawler">
                                        <?php
                    						$headlines = $this->post()->getHeadline('5', 'DESC', WEB_LANG_ID);
                    						foreach($headlines as $headline){
                    					?>
                                            <div>
                                                <span class="ticker_dot"><i class="fa fa-chevron-right"></i></span><a class="ticker_title" href="<?=BASE_URL;?>/detailpost/<?=$headline['seotitle'];?>"><?=$headline['title'];?></a>
                                            </div>
                                        <?php } ?>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="six columns header-top-right-bar">
                        <a class="open toggle-lef sb-toggle-left navbar-left" href="#nav">
                        <div class="navicon-line"></div>
                        <div class="navicon-line"></div>
                        <div class="navicon-line"></div>
                        </a>

                        <div id="search_block_top">
                            <form action="<?=BASE_URL;?>/search" method="post"  role="form">
                                <p><input class="search_query ac_input" id="search_query_top" name="search" placeholder="<?=$this->e($front_search);?>..." > 
                                <button type="submit"><img alt="" src="<?=$this->asset('/images/search_form_icon_w.png');?>"></button></p>
                            </form>
                            <span><?=$this->e($front_search);?></span>

                            <div class="clearfix">
                            </div>
                        </div>
                        
                        <div class="menu-primary-container main-menu" style="float: left;margin-top: 6px;">
                        <ul class='sf-menu'>
                           <li>
                                <a href="javascript:void(0)" style="line-height: 0px; font-size: 12px;"><?=$this->e($front_select_lang);?></a>
        						<ul class="sub-menu">
                                    <li>
        							<form method="post" action="<?=BASE_URL;?>/./" role="form" style="margin-bottom:0px;">
        								<input type="hidden" name="refer" value="<?=((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] && !in_array(strtolower($_SERVER['HTTPS']),array('off','no'))) ? 'https' : 'http').'://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];?>" />
        								<div class="form-group">
        									<select id="selectzagi" name="lang" required="">
        									<?php
        										$languages = $this->language()->getLanguage('ASC');
        										foreach($languages as $language){
        											echo "<option value='".$language['code']."' ".($language['code'] == WEB_LANG ? 'selected' : '').">".$language['title']."</option>";
        										}
        									?>
        									</select>
        								</div>
        								   <center><button class="btn" type="submit"><?=$this->e($front_change_lang);?></button></center> 
        							</form>
                                    </li>
        						</ul>
        					</li>
    					<?php if ($this->pocore()->call->posetting[17]['value'] == 'Y') { ?>
    						<?php if (empty($_SESSION['namauser_member']) AND empty($_SESSION['passuser_member']) AND empty($_SESSION['login_member'])) { ?>
    						<li><a href="<?=BASE_URL;?>/member/login" style="line-height: 0px;font-size: 12px;"><?=$this->e($front_member_login);?></a></li>
    						<li><a href="<?=BASE_URL;?>/member/register" style="line-height: 0px;font-size: 12px;"><?=$this->e($front_member_register);?></a></li>
    						<?php } else { ?>
    						<li><a href="<?=BASE_URL;?>/member" style="line-height: 0px;font-size: 12px;"><?=$_SESSION['namauser_member'];?></a></li>
    						<?php } ?>
    					<?php } ?>
                        </ul>
                        </div>

                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="header_main_wrapper">
                <div class="row">
                    <div class="four columns header-top-left">
                        <!-- begin logo -->
                        <a href="<?=BASE_URL;?>"><img alt="Logo" id="theme_logo_img" src="<?=BASE_URL.'/'.DIR_INC;?>/images/logo.png"></a> <!-- end logo -->
                        <!-- end logo -->
                    </div>


                    <div class="eight columns header-top-right">
                            <div class="ads728x90-thumb">
                                <a href="#"><img src="<?=BASE_URL;?>/<?=DIR_CON;?>/uploads/ad-long.jpg" alt=""></a>
                            </div>
                        </div>
                </div>
            </div>
            
            <div class="menu_wrapper menu_sticky" id="menu_wrapper">
                <div class="menu_border_top_full"></div>
                <div class="row">
                    <div class="main_menu twelve columns">
                        <div class="menu_border_top"></div>
                        <!-- main menu -->
                        <div class="menu-primary-container main-menu">
                            <?php
                                echo $this->menu()->getFrontMenu(WEB_LANG, "class='sf-menu' id='mainmenu'", "class='menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children'", "class='sub-menu'");
            				?>
                            <div class="clearfix"></div>
                        </div>
                        <!-- end main menu -->
                    </div>
                </div>
            </div>
            
            
            
</header>

              
