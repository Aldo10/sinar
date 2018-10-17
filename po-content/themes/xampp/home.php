   <?=$this->layout('index');?>  
   <div class="eight columns content_display_col1" id="content">
      <div class="aq-template-wrapper aq_row" id="aq-template-wrapper-136">
        
        <!-- awal slider -->
         <div class="row header-slider-home header-slider-home-list-right">
           <div class="twelve columns feature-three"> 
             <div class="full-width-slider header-slider2">
                <div class="widget owl_slider slider-large full-width-slider owl-carousel">
                <?php
                $sliders_post = $this->post()->getPost('6', 'DESC', WEB_LANG_ID);
			    foreach($sliders_post as $slider_post){
			    $slider_category = $this->category()->getCategory($slider_post['id_post'], WEB_LANG_ID);
                ?>
                
                <div class="item_slide image_post">
                  <a class="feature-link" href="<?=BASE_URL;?>/detailpost/<?=$slider_post['seotitle'];?>" title="<?=$slider_post['title'];?>">
                    <img alt="" class="attachment-slider-feature" height="400" src="<?=BASE_URL;?>/<?=DIR_CON;?>/uploads/<?=$slider_post['picture'];?>" width="735"><span class="overlay_icon fa fa-eye"></span>
                  </a>
                 
                  <div class="item_slide_caption">
                    <p class="post-meta meta-main-img">
                        <span class="post-date updated"><i class="fa fa-clock-o"></i><?=$this->pocore()->call->podatetime->tgl_indo($slider_post['date']);?></span>
                        <span class="meta-cat"><i class="fa fa-book"></i><a rel="category tag" href="<?=BASE_URL;?>/category/<?=$slider_category['seotitle'];?>"><?=$slider_category;?></a></span>
                        <span class="meta-comment"><a href="<?=BASE_URL;?>/detailpost/<?=$slider_post['seotitle'];?>#comments"><i class="fa fa-comments"></i><?=$this->post()->getCountComment($slider_post['id_post']);?> <?=$this->e($front_comment);?></a></span>
                    </p>
                    <h1>
                      <a href="<?=BASE_URL;?>/detailpost/<?=$slider_post['seotitle'];?>"><?=$slider_post['title'];?></a>
                    </h1>
                    <div class="clearfix"></div>
                  </div>
                  
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
        </div>
        <!-- akhir slider -->
        
        
        <div class="aq-block aq-block-home_main_post_right_list_scroll aq_span12 aq-first clearfix" id="aq-block-134-2">
                            <div class="widget main_post_style main_right_post_style_list_scroll clearfix color-3">
                                <div class="widget-title">
                                    <?php $category_title = $this->category()->getOneCategory('1', WEB_LANG_ID); ?>
                                    <h2><?=$category_title['title'];?></h2>
                                </div>


                                <div class="widget_container">
                                    <?php
                                        $post_by_categorys = $this->post()->getPostByCategory('1','1', 'DESC', WEB_LANG_ID);
                                        foreach($post_by_categorys as $list_post){
                                            
                                            $editor = $this->post()->getAuthor($list_post['editor']);
                                                if ($editor['picture'] != '') {
                                                    $editor_avatar = BASE_URL.'/'.DIR_CON.'/uploads/'.$editor['picture'];
                        						} else {
                        							$editor_avatar = BASE_URL.'/'.DIR_CON.'/uploads/user-editor.jpg';
                        						}
                                    ?>
                                    <div class="feature-two-column left-post-display-content margin-left-post main-post-right-list appear_animation feature-custom">
                                        <div class="two-content-wrapper main_feature_images">
                                            <div class="image_post feature-item">
                                                <a class="feature-link" href="<?=BASE_URL;?>/detailpost/<?=$list_post['seotitle'];?>" title="<?=$list_post['title'];?>">
                                                    <img alt="" class="attachment-medium-feature" height="260" src="<?=BASE_URL;?>/<?=DIR_CON;?>/uploads/medium/medium_<?=$list_post['picture'];?>" width="400">
                                                    <span class="overlay_icon fa fa-eye"></span>
                                                </a>
                                            </div>
                                            <h3 class="image-post-title"><a href="<?=BASE_URL;?>/detailpost/<?=$list_post['seotitle'];?>"><?=$list_post['title'];?></a></h3>
                                            <p class="post-meta meta-main-img">
                                                <span class="post-author">
                                                    <img src="<?=$editor_avatar;?>" class="avatar avatar-16  alignnone photo" height="16" width="16">
                                                    <a rel="author" title="<?=$this->e($front_post_by);?> <?=$this->post()->getAuthorName($list_post['editor']);?>">
                                                        <?=$this->post()->getAuthorName($list_post['editor']);?>
                                                    </a>
                                                </span>
                                                <span class="post-date updated"><i class="fa fa-clock-o"></i><?=$this->pocore()->call->podatetime->tgl_indo($list_post['date']);?></span>
                                                <span class="meta-comment"><a href="<?=BASE_URL;?>/detailpost/<?=$list_post['seotitle'];?>#comments"><i class="fa fa-comments"></i><?=$this->post()->getCountComment($list_post['id_post']);?> <?=$this->e($front_comment);?></a></span>
                                            </p>
                                            <p><?=$this->pocore()->call->postring->cuthighlight('post', $list_post['content'], '100');?>...</p>
                                            <div class="footer_meta">
                                                <a class="footer_meta_readmore" href="<?=BASE_URL;?>/detailpost/<?=$list_post['seotitle'];?>"><?=$this->e($front_readmore);?></a>
                                                <span class="meta-commentd"><a><i class="fa fa-eye"></i><?=$list_post['hits'];?> <?=$this->e($front_hits);?></a></span>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>

                                    <div class="feature-two-column right-post-display-content list-post-right">
                                        <ul class="feature-post-list slider8">
                                            <?php
                            					$post_by_categorys2 = $this->post()->getPostByCategory('1','1,8', 'DESC', WEB_LANG_ID);
                            					foreach($post_by_categorys2 as $list_post2){
                            				?>
                                            <li>
                                                <a class="feature-image-link image_post" href="<?=BASE_URL;?>/detailpost/<?=$list_post2['seotitle'];?>" title="<?=$list_post2['title'];?>">
                                                    <img alt="" class="attachment-small-feature" height="75" src="<?=BASE_URL;?>/<?=DIR_CON;?>/thumbs/<?=$list_post2['picture'];?>" width="100">
                                                    <span class="overlay_icon fa fa-eye"></span>
                                                </a>
                                                
                                                <div class="item-details"  style="color:#39b54a;">
                                                    <div class="review_star_small_list"><i class="fa fa-eye"></i><span class="number"><?=$list_post2['hits'];?> <?=$this->e($front_hits);?></span></div>
                                                    <h3 class="feature-post-title" ><a href="<?=BASE_URL;?>/detailpost/<?=$list_post2['seotitle'];?>" ><?=$list_post2['title'];?></a></h3>
                                                    <p class="post-meta meta-main-img">
                                                        <span class="post-date"><i class="fa fa-clock-o"></i><?=$this->pocore()->call->podatetime->tgl_indo($list_post2['date']);?></span>
                                                        <span class="meta-comment"><a href="<?=BASE_URL;?>/detailpost/<?=$list_post2['seotitle'];?>#comments"><i class="fa fa-comments"></i><?=$this->post()->getCountComment($list_post2['id_post']);?> <?=$this->e($front_comment);?></a></span>
                                                    </p>
                                                </div>
                                                <div class="clearfix"></div>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                                                                                            
                                </div>
                                
                            </div>
                        </div>

                        <div class="aq-block aq-block-home_carousel_post aq_span12 aq-first clearfix" id="aq-block-134-3">
                            <div class="widget carousel_pagebuilder_wrapper color-11">
                                <div class="widget-title">
                                    <?php $category_title2 = $this->category()->getOneCategory('2', WEB_LANG_ID); ?>
                                    <h2><?=$category_title2['title'];?></h2>
                                </div>


                                <div class="owl_carousel_builder carousel_pagebuilder">
                                    <?php
                    					$post_by_categorys3 = $this->post()->getPostByCategory('2', '1,8', 'DESC', WEB_LANG_ID);
                    					foreach($post_by_categorys3 as $list_post3){
                    					   
                                            $editor2 = $this->post()->getAuthor($list_post3['editor']);
                                            if ($editor2['picture'] != '') {
                 								$editor_avatar2 = BASE_URL.'/'.DIR_CON.'/uploads/'.$editor2['picture'];
                     						} else {
                                                $editor_avatar2 = BASE_URL.'/'.DIR_CON.'/uploads/user-editor.jpg';
                        					}   
                    				?>
                                    <div class="feature-four-column medium-four-columns appear_animation">
                                        <div class="image_post feature-item">
                                            <a class="feature-link" href="<?=BASE_URL;?>/detailpost/<?=$list_post3['seotitle'];?>" title="<?=$list_post3['title'];?>"><img alt="" class="attachment-medium-feature" height="260" src="<?=BASE_URL;?>/<?=DIR_CON;?>/thumbs/<?=$list_post3['picture'];?>" width="400"><span class="overlay_icon fa fa-eye"></span></a>
                                        </div>

                                        <div class="meta_holder">
                                            <div class="review_star_small_list">
                                                <i class="fa fa-eye"></i>
                                                <span class="number"><?=$list_post3['hits'];?> <?=$this->e($front_hits);?></span>
                                            </div>
                                                    
                                            <div class="love_this_post_meta">
                                                <a class="jm-post-like" title="<?=$this->e($front_comment);?>" href="<?=BASE_URL;?>/detailpost/<?=$list_post3['seotitle'];?>#comments">
                                                    <i class="fa fa-comments"></i><?=$this->post()->getCountComment($list_post3['id_post']);?> 
                                                </a>
                                            </div>
                                        </div>

                                        <h3 class="image-post-title columns_post"><a href="<?=BASE_URL;?>/detailpost/<?=$list_post3['seotitle'];?>"><?=$list_post3['title'];?></a>
                                        </h3>

                                        <p class="post-meta meta-main-img">
                                            <span class="post-author">
                                                <img src="<?=$editor_avatar2;?>" class="avatar avatar-16  alignnone photo" height="16" width="16">
                                                <a rel="author" title="<?=$this->e($front_post_by);?> <?=$this->post()->getAuthorName($list_post3['editor']);?>">
                                                    <?=$this->post()->getAuthorName($list_post3['editor']);?>
                                                </a>
                                            </span>
                                            <span class="post-date"><i class="fa fa-clock-o"></i><?=$this->pocore()->call->podatetime->tgl_indo($list_post3['date']);?></span>
                                        </p>
                                        
                                        <p><?=$this->pocore()->call->postring->cuthighlight('post', $list_post3['content'], '80');?>...</p>

                                        <div class="footer_meta">
                                            <a class="footer_meta_readmore" href="<?=BASE_URL;?>/detailpost/<?=$list_post3['seotitle'];?>"><?=$this->e($front_readmore);?></a>
                                        </div>
                                    </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>

                        <div class="widget">
                            <div class="ads728x90-thumb">
                                <a href="#"><img src="<?=BASE_URL;?>/<?=DIR_CON;?>/uploads/ad-long.jpg" alt=""></a>
                            </div>
                        </div>
                        
                        <div class="aq-block aq-block-home_post_two_columns aq_span12 aq-first clearfix" id="aq-block-134-5">
                            <div class="widget two_columns_post builder_two_cols">
                                
                                <div class="feature-two-column list-col1-home left-post-display-content margin-left-post color-1">
                                    <div class="widget-title">
                                    <?php $category_title3 = $this->category()->getOneCategory('3', WEB_LANG_ID); ?>
                                        <h2><?=$category_title3['title'];?></h2>
                                    </div>
                                    <?php
                        					$post_by_categorys4 = $this->post()->getPostByCategory('3', '1', 'DESC', WEB_LANG_ID);
                        					foreach($post_by_categorys4 as $list_post4){
                        					   
                        					   $editor3 = $this->post()->getAuthor($list_post4['editor']);
                                                if ($editor3['picture'] != '') {
                                                    $editor_avatar3 = BASE_URL.'/'.DIR_CON.'/uploads/'.$editor3['picture'];
                        						} else {
                        							$editor_avatar3 = BASE_URL.'/'.DIR_CON.'/uploads/user-editor.jpg';
                        						}
                                    ?>
                                    <div class="two_col_builder two-content-wrapper medium-two-columns appear_animation">
                                        
                                        <div class="image_post feature-item">
                                            <a class="feature-link" href="<?=BASE_URL;?>/detailpost/<?=$list_post4['seotitle'];?>" title="<?=$list_post4['title'];?>">
                                                <img alt="images" class="attachment-medium-feature " height="260" src="<?=BASE_URL;?>/<?=DIR_CON;?>/uploads/medium/medium_<?=$list_post4['picture'];?>" width="400">
                                                <span class="overlay_icon fa fa-eye"></span>
                                            </a>
                                        </div>
                                        
                                        <div class="wrap_box_style_main feature-custom-below main_post_2col_style">
                                            <div class="meta_holder">
                                                <div class="review_star_small_list">
                                                    <i class="fa fa-eye"></i>
                                                    <span class="number"><?=$list_post4['hits'];?> <?=$this->e($front_hits);?></span>
                                                </div>
                                                        
                                                <div class="love_this_post_meta">
                                                    <a class="jm-post-like" title="<?=$this->e($front_comment);?>" href="<?=BASE_URL;?>/detailpost/<?=$list_post4['seotitle'];?>#comments">
                                                        <i class="fa fa-comments"></i><?=$this->post()->getCountComment($list_post4['id_post']);?> 
                                                    </a>
                                                </div>
                                            </div>
                                            <h3 class="image-post-title"><a href="<?=BASE_URL;?>/detailpost/<?=$list_post4['seotitle'];?>"><?=$list_post4['title'];?></a>
                                            </h3>
                                            <p class="post-meta meta-main-img">
                                                <span class="post-author">
                                                    <img src="<?=$editor_avatar3;?>" class="avatar avatar-16  alignnone photo" height="16" width="16">
                                                    <a rel="author" title="<?=$this->e($front_post_by);?> <?=$this->post()->getAuthorName($list_post4['editor']);?>">
                                                        <?=$this->post()->getAuthorName($list_post4['editor']);?>
                                                    </a>
                                                </span>
                                                <span class="post-date"><i class="fa fa-clock-o"></i><?=$this->pocore()->call->podatetime->tgl_indo($list_post4['date']);?></span>
                                            </p>
                                            
                                            <p><?=$this->pocore()->call->postring->cuthighlight('post', $list_post4['content'], '80');?>...</p>
                                            
                                            <div class="footer_meta">
                                                <a class="footer_meta_readmore" href="<?=BASE_URL;?>/detailpost/<?=$list_post4['seotitle'];?>"><?=$this->e($front_readmore);?></a>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                    <div class="wrap_box_style_ul">
                                        <ul class="feature-post-list">
                                            <?php
                            					$post_by_categorys5 = $this->post()->getPostByCategory('3', '1,5', 'DESC', WEB_LANG_ID);
                            					foreach($post_by_categorys5 as $list_post5){
                            				?>
                                            <li class="appear_animation">
                                                <a class="feature-image-link image_post" href="<?=BASE_URL;?>/detailpost/<?=$list_post5['seotitle'];?>" title="<?=$list_post5['title'];?>">
                                                    <img alt="images" class="attachment-small-feature" height="75" src="<?=BASE_URL;?>/<?=DIR_CON;?>/uploads/medium/medium_<?=$list_post5['picture'];?>" width="100">
                                                    <span class="overlay_icon fa fa-eye"></span>
                                                </a>
                                                <div class="item-details">
                                                    <div class="meta_holder">
                                                        <div class="review_star_small_list">
                                                            <i class="fa fa-eye"></i>
                                                            <span class="number"><?=$list_post5['hits'];?> <?=$this->e($front_hits);?></span>
                                                        </div>
                                                                
                                                        <div class="love_this_post_meta">
                                                            <a class="jm-post-like" title="<?=$this->e($front_comment);?>" href="<?=BASE_URL;?>/detailpost/<?=$list_post5['seotitle'];?>#comments">
                                                                <i class="fa fa-comments"></i><?=$this->post()->getCountComment($list_post5['id_post']);?> 
                                                            </a>
                                                        </div>
                                                    </div>
                                                    
                                                    <h3 class="feature-post-title"><a href="<?=BASE_URL;?>/detailpost/<?=$list_post5['seotitle'];?>"><?=$list_post5['title'];?></a></h3>
                                                    <p class="post-meta meta-main-img">
                                                        <span class="post-date"><i class="fa fa-clock-o"></i><?=$this->pocore()->call->podatetime->tgl_indo($list_post5['date']);?></span>
                                                    </p>
                                                </div>
                                                
                                                <div class="clearfix"></div>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                </div>
                                
                                <div class="feature-two-column right-post-display-content color-12">
                                    <div class="widget-title">
                                    <?php $category_title4 = $this->category()->getOneCategory('4', WEB_LANG_ID); ?>
                                        <h2><?=$category_title4['title'];?></h2>
                                    </div>
                                    <?php
                        					$post_by_categorys6 = $this->post()->getPostByCategory('4', '1', 'DESC', WEB_LANG_ID);
                        					foreach($post_by_categorys6 as $list_post6){
                        					   
                        					   $editor4 = $this->post()->getAuthor($list_post6['editor']);
                                                if ($editor4['picture'] != '') {
                                                    $editor_avatar4 = BASE_URL.'/'.DIR_CON.'/uploads/'.$editor4['picture'];
                        						} else {
                        							$editor_avatar4 = BASE_URL.'/'.DIR_CON.'/uploads/user-editor.jpg';
                        						}
                                    ?>
                                    <div class="two_col_builder two-content-wrapper medium-two-columns appear_animation">
                                        
                                        <div class="image_post feature-item">
                                            <a class="feature-link" href="<?=BASE_URL;?>/detailpost/<?=$list_post6['seotitle'];?>" title="<?=$list_post6['title'];?>">
                                                <img alt="images" class="attachment-medium-feature " height="260" src="<?=BASE_URL;?>/<?=DIR_CON;?>/uploads/medium/medium_<?=$list_post6['picture'];?>" width="400">
                                                <span class="overlay_icon fa fa-eye"></span>
                                            </a>
                                        </div>
                                        
                                        <div class="wrap_box_style_main feature-custom-below main_post_2col_style">
                                            <div class="meta_holder">
                                                <div class="review_star_small_list">
                                                    <i class="fa fa-eye"></i>
                                                    <span class="number"><?=$list_post6['hits'];?> <?=$this->e($front_hits);?></span>
                                                </div>
                                                        
                                                <div class="love_this_post_meta">
                                                    <a class="jm-post-like" title="<?=$this->e($front_comment);?>" href="<?=BASE_URL;?>/detailpost/<?=$list_post6['seotitle'];?>#comments">
                                                        <i class="fa fa-comments"></i><?=$this->post()->getCountComment($list_post6['id_post']);?> 
                                                    </a>
                                                </div>
                                            </div>
                                            <h3 class="image-post-title"><a href="<?=BASE_URL;?>/detailpost/<?=$list_post6['seotitle'];?>"><?=$list_post6['title'];?></a>
                                            </h3>
                                            <p class="post-meta meta-main-img">
                                                <span class="post-author">
                                                    <img src="<?=$editor_avatar4;?>" class="avatar avatar-16  alignnone photo" height="16" width="16">
                                                    <a rel="author" title="<?=$this->e($front_post_by);?> <?=$this->post()->getAuthorName($list_post6['editor']);?>">
                                                        <?=$this->post()->getAuthorName($list_post6['editor']);?>
                                                    </a>
                                                </span>
                                                <span class="post-date"><i class="fa fa-clock-o"></i><?=$this->pocore()->call->podatetime->tgl_indo($list_post6['date']);?></span>
                                            </p>
                                            
                                            <p><?=$this->pocore()->call->postring->cuthighlight('post', $list_post6['content'], '80');?>...</p>
                                            
                                            <div class="footer_meta">
                                                <a class="footer_meta_readmore" href="<?=BASE_URL;?>/detailpost/<?=$list_post6['seotitle'];?>"><?=$this->e($front_readmore);?></a>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                    <div class="wrap_box_style_ul">
                                        <ul class="feature-post-list">
                                            <?php
                            					$post_by_categorys7 = $this->post()->getPostByCategory('4', '1,5', 'DESC', WEB_LANG_ID);
                            					foreach($post_by_categorys7 as $list_post7){
                            				?>
                                            <li class="appear_animation">
                                                <a class="feature-image-link image_post" href="<?=BASE_URL;?>/detailpost/<?=$list_post7['seotitle'];?>" title="<?=$list_post7['title'];?>">
                                                    <img alt="images" class="attachment-small-feature" height="75" src="<?=BASE_URL;?>/<?=DIR_CON;?>/uploads/medium/medium_<?=$list_post7['picture'];?>" width="100">
                                                    <span class="overlay_icon fa fa-eye"></span>
                                                </a>
                                                <div class="item-details">
                                                    <div class="meta_holder">
                                                        <div class="review_star_small_list">
                                                            <i class="fa fa-eye"></i>
                                                            <span class="number"><?=$list_post7['hits'];?> <?=$this->e($front_hits);?></span>
                                                        </div>
                                                                
                                                        <div class="love_this_post_meta">
                                                            <a class="jm-post-like" title="<?=$this->e($front_comment);?>" href="<?=BASE_URL;?>/detailpost/<?=$list_post7['seotitle'];?>#comments">
                                                                <i class="fa fa-comments"></i><?=$this->post()->getCountComment($list_post7['id_post']);?> 
                                                            </a>
                                                        </div>
                                                    </div>
                                                    
                                                    <h3 class="feature-post-title"><a href="<?=BASE_URL;?>/detailpost/<?=$list_post7['seotitle'];?>"><?=$list_post7['title'];?></a></h3>
                                                    <p class="post-meta meta-main-img">
                                                        <span class="post-date"><i class="fa fa-clock-o"></i><?=$this->pocore()->call->podatetime->tgl_indo($list_post7['date']);?></span>
                                                    </p>
                                                </div>
                                                
                                                <div class="clearfix"></div>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                </div>
                                
                            </div>
                        </div>

      </div>
    </div>
    
    <?=$this->insert('sidebar');?>
    <div class="clearfix"></div>
    