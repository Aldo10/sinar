    <div class="four columns content_display_col3" id="sidebar">
                
              <div class="widget tab_widget" id="triple-posts-4">
                <div class="widget_container" id="tabs">
                  
                  <!--tabs-nav -->
                  <ul class="tabs">
                    <li class="active">
                      <a class="title" href="#tab1"><?=$this->e($front_popular);?></a>
                    </li>
                    <li>
                      <a class="title" href="#tab2"><?=$this->e($front_recent);?></a>
                    </li>
                    <li>
                      <a class="title" href="#tab3"><?=$this->e($front_comment);?></a>
                    </li>
                  </ul>
                  <!-- end tabs-nav -->
                  
                  <div class="tab-container">
                    <!--tab1 -->
                    <div class="tab-content" id="tab1">
                      <ul class="feature-post-list">
                        <?php
    						$populars_side = $this->post()->getPopular('10', 'DESC', WEB_LANG_ID);
    						foreach($populars_side as $popular_side){
      						    $editor5 = $this->post()->getAuthor($popular_side['editor']);
                                if ($editor5['picture'] != '') {
                                    $editor_avatar5 = BASE_URL.'/'.DIR_CON.'/uploads/'.$editor5['picture'];
          						} else {
         							$editor_avatar5 = BASE_URL.'/'.DIR_CON.'/uploads/user-editor.jpg';
          						}
    					?>
                        <li class="tab-content-class appear_animation">
                          <a class="feature-image-link image_post" href="<?=BASE_URL;?>/detailpost/<?=$popular_side['seotitle'];?>" title="<?=$popular_side['title'];?>">
                            <img alt="images" class="attachment-small-feature" height="75" src="<?=BASE_URL;?>/<?=DIR_CON;?>/thumbs/<?=$popular_side['picture'];?>" width="100">
                            <span class="overlay_icon fa fa-eye"></span>
                          </a>
                          <div class="item-details">
                            
                            <div class="meta_holder">
                                <div class="review_star_small_listb">
                                    <i class="fa fa-eye"></i>
                                    <span class="number"><?=$popular_side['hits'];?> <?=$this->e($front_hits);?></span>
                                </div>
                                                        
                                <div class="love_this_post_meta">
                                    <a class="jm-post-like" title="<?=$this->e($front_comment);?>" href="<?=BASE_URL;?>/detailpost/<?=$popular_side['seotitle'];?>#comments">
                                        <i class="fa fa-comments"></i><?=$this->post()->getCountComment($popular_side['id_post']);?> 
                                    </a>
                                </div>
                            </div>
                            
                            <h3 class="feature-post-title">
                              <a href="<?=BASE_URL;?>/detailpost/<?=$popular_side['seotitle'];?>"><?=$popular_side['title'];?></a>
                            </h3>
                            <p class="post-meta meta-main-img">
                                <span class="post-author">
                                    <img src="<?=$editor_avatar5;?>" class="avatar avatar-16  alignnone photo" height="16" width="16">
                                    <a rel="author" title="<?=$this->e($front_post_by);?> <?=$this->post()->getAuthorName($popular_side['editor']);?>">
                                        <?=$this->post()->getAuthorName($popular_side['editor']);?>
                                    </a>
                                </span>
                                <span class="post-date"><i class="fa fa-clock-o"></i><?=$this->pocore()->call->podatetime->tgl_indo($popular_side['date']);?></span>
                            </p>
                          </div>
                          <div class="clearfix"></div>
                        </li>
                        <?php } ?>
                      </ul>
                    </div>
                    <!-- end tab1 -->
                    
                    <!--tab2 -->
                    <div class="tab-content" id="tab2">
                      <ul class="feature-post-list">
                         <?php
    						$recents_side = $this->post()->getRecent('10', 'DESC', WEB_LANG_ID);
    						foreach($recents_side as $recent_side){
    					 ?>
                        <li class="tab-content-class">
                          <a class="feature-image-link image_post" href="<?=BASE_URL;?>/detailpost/<?=$recent_side['seotitle'];?>" title="<?=$recent_side['title'];?>">
                              <img alt="images" class="attachment-small-feature" height="75" src="<?=BASE_URL;?>/<?=DIR_CON;?>/thumbs/<?=$recent_side['picture'];?>" width="100">
                              <span class="overlay_icon fa fa-eye"></span>
                          </a>
                          <div class="item-details">
                            <div class="meta_holder">
                                <div class="review_star_small_listb">
                                    <i class="fa fa-eye"></i>
                                    <span class="number"><?=$recent_side['hits'];?> <?=$this->e($front_hits);?></span>
                                </div>
                                                        
                                <div class="love_this_post_meta">
                                    <a class="jm-post-like" title="<?=$this->e($front_comment);?>" href="<?=BASE_URL;?>/detailpost/<?=$recent_side['seotitle'];?>#comments">
                                        <i class="fa fa-comments"></i><?=$this->post()->getCountComment($recent_side['id_post']);?> 
                                    </a>
                                </div>
                            </div>
                            <h3 class="feature-post-title">
                              <a href="<?=BASE_URL;?>/detailpost/<?=$recent_side['seotitle'];?>"><?=$recent_side['title'];?></a>
                            </h3>
                            <p class="post-meta meta-main-img">
                                <span class="post-author">
                                    <img src="<?=$editor_avatar5;?>" class="avatar avatar-16  alignnone photo" height="16" width="16">
                                    <a rel="author" title="<?=$this->e($front_post_by);?> <?=$this->post()->getAuthorName($recent_side['editor']);?>">
                                        <?=$this->post()->getAuthorName($recent_side['editor']);?>
                                    </a>
                                </span>
                                <span class="post-date"><i class="fa fa-clock-o"></i><?=$this->pocore()->call->podatetime->tgl_indo($recent_side['date']);?></span>
                            </p>
                          </div>
                          <div class="clearfix"></div>
                        </li>
                        <?php } ?>
                      </ul>
                    </div>
                    <!-- end tab2 -->
                    
                    <!--tab3 -->
                    <div class="tab-content comment_tab" id="tab3">
                      <ul class="feature-post-list">
                        <?php
    						$comments_side = $this->post()->getComment('10', 'DESC');
    						foreach($comments_side as $comment_side){
    						$comment_post = $this->post()->getPostById($comment_side['id_post'], WEB_LANG_ID);
    					?>
                        <li class="tab-content-class">
                          <a class="feature-image-link" href="<?=BASE_URL;?>/detailpost/<?=$comment_post['seotitle'];?>#comment">
                            <img alt="admin" class="avatar avatar-80 alignnone photo" height="80" src="<?=BASE_URL;?>/<?=DIR_CON;?>/uploads/medium/medium_avatar.jpg" width="80">
                          </a>
                          <div class="item-details">
                            <h3 class="feature-post-title">
                              <a class="post-title" href="<?=BASE_URL;?>/detailpost/<?=$comment_post['seotitle'];?>#comment"><?=$comment_side['name'];?></a>
                            </h3>
                            <p class="post-meta meta-list-small">
                              <span class="post-date"><?=$this->pocore()->call->postring->cuthighlight('post', $comment_side['comment'], '80');?>...</span>
                            </p>
                          </div>
                        </li>
                        <?php } ?>
                      </ul>
                    </div><!-- end tab3 -->
                  </div>
                  <div class="clearfix"></div>
                </div><!-- end tabs-container -->
              </div>
             
             
              <h3 class="widget-title">
                  <span><?=$this->e($front_gallery);?></span>
              </h3>
              <div class="widget carousel_post" id="rec-carousel-posts-3">
                <div class="owl_slider slider-large-widget content-sliders owl-carousel sidebar widget_caption_slider appear_animation">
                  <?php
        				$albums = $this->gallery()->getAlbum('8', 'id_album ASC','1');
				        foreach($albums as $alb){
        		  ?>
                  <div class="item_slide widget_slider image_post">
                    <a class="feature-link" href="<?=BASE_URL.'/gallery/'.$this->e($alb['seotitle']);?>" title="<?=$alb['title'];?>">
                        <img alt="album" class="attachment-medium-feature" height="260" src="<?=BASE_URL.'/'.DIR_CON.'/uploads/medium/medium_'.$alb['picture'];?>" width="400">
                        <span class="overlay_icon fa fa-eye"></span>
                    </a>
                    <div class="item_slide_caption">
                      <h1 class="widget_slider">
                        <a href="<?=BASE_URL.'/gallery/'.$this->e($alb['seotitle']);?>"><?=$alb['title'];?></a>
                      </h1>
                    </div>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <div class="widget">

                <div class="widget-title"><h2>Facebook</h2></div>	
                <div class="ads300x250-thumb">
            		<iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fpopojicms&amp;width=350&amp;height=240&amp;colorscheme=light&amp;show_faces=true&amp;header=true&amp;stream=false&amp;show_border=true&amp;appId=499481203443583" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:350px; height:240px; max-width: 100% !important;" allowTransparency="true"></iframe>
            	</div>
            </div>
            <div class="widget widget_categories" id="categories-8">
                    <div class="widget-title">
                        <h2><?=$this->e($front_categories);?></h2>
                    </div>
                    <ul>
                    <?php
        				$categorys_side = $this->category()->getAllCategory(WEB_LANG_ID);
        				foreach($categorys_side as $category_side){
        			?>
                        <li class="cat-item cat-item-2">
                            <a href="<?=BASE_URL;?>/category/<?=$category_side['seotitle'];?>"><?=$category_side['title'];?></a>
                        </li>
                       <?php } ?> 
                    </ul>
                </div>
                
             <h3 class="widget-title">
               <span><?=$this->e($front_tag);?></span>
             </h3>
             <div id="tags" class="widget clearfix">
        		<div class="tagcloud">
        			<?=$this->post()->getAllTag('RAND()', '30', '');?>
        		</div>
        	</div>
            
            
            <div class="widget">

                <div class="widget-title"><h2>Your ads here</h2></div>				
    		
    			<div class="ads300x250-thumb">
    				<a href="#">
    					<img alt="" src="<?=BASE_URL;?>/<?=DIR_CON;?>/uploads/ad-square.png">
    				</a>
    			</div>
    		</div>

    </div>