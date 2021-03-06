<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-puzzle-piece"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="input-group">
            <input type="text" name="search" value="" placeholder="{{ text_search }}" class="form-control" />
            <div class="input-group-btn"><?php foreach ($categories as $category) { ?>
              <?php if (category.value == filter_category) { ?>
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">{{ text_category }} ({{ category.text }}) <span class="caret"></span></button>
              {% endif %}
              {% endfor %}
              <ul class="dropdown-menu">
                {% for category in categories %}
                <li><a href="{{ category.href }}">{{ category.text }}</a></li>
                {% endfor %}
              </ul>
              <button type="button" id="button-filter" class="btn btn-primary"><i class="fa fa-filter"></i></button>
            </div>
          </div>
        </div>
        </fieldset>
        <div class="row">
          <div class="col-sm-9 col-xs-7">
            <div class="btn-group">{% for license in licenses %}
              {% if license.value == filter_license %}<a href="{{ license.href }}" class="btn btn-default active">{{ license.text }}</a>{% else %}<a href="{{ license.href }}" class="btn btn-default">{{ license.text }}</a>{% endif %}
              {% endfor %}</div>
          </div>
          <div class="col-sm-3 col-xs-5">
            <div class="input-group pull-right">
              <div class="input-group-addon"><i class="fa fa-sort-amount-asc"></i></div>
              <select onchange="location = this.value;" class="form-control">
                
                
                
                  {% for sorts in sorts %}
                  {% if sorts.value == sort %}
                  
                
                <option value="{{ sorts.href }}" selected="selected">{{ sorts.text }}</option>
                
                
                  {% else %}
                  
                
                <option value="{{ sorts.href }}">{{ sorts.text }}</option>
                
                
                  {% endif %}
                  {% endfor %}
                  
              
              </select>
            </div>
          </div>
        </div>
        <br />
        {% if extensions %}
        {% for extension in extensions|batch(3, '') %}
        <div class="row"> {% for extension in extension %}
          <div class="col-sm-4">
            <div class="thumbnail"><a href="{{ extension.href }}"><img src="{{ extension.image }}" alt="{{ extension.name }}" title="{{ extension.name }}" class="img-responsive" /></a>
              <div class="caption">
                <div>
                  <h4><a href="{{ extension.href }}">{{ extension.name }}</a></h4>
                  {{ extension.price }} </div>
                {% for i in 1..5 %}
                {% if i < extension.rating %}<i class="fa fa-star"></i>{% else %}<i class="fa fa-star-o"></i>{% endif %} 
                {% endfor %}
                <div>{{ extension.comment_total }}</div>
              </div>
            </div>
          </div>
          {% endfor %}</div>
        {% endfor %}
        <div class="row">
          <div class="col-sm-12 text-center">{{ pagination }}</div>
        </div>
        {% else %}
        <div>{{ no_results }}</div>
        {% endif %} </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 