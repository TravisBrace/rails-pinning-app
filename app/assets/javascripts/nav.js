var main = function () {
  $('.left').mouseenter(function() {
    $('.left').toggleClass('left-open');
    $('ul').toggle('li');
    $('.right').toggleClass('right-open');
    $('.tab').toggleClass('tab-open');
 });
  
  $('.left').mouseleave(function() {
    $('.left').toggleClass('left-open');
    $('ul').toggle('li');
    $('.right').toggleClass('right-open');
    $('.tab').toggleClass('tab-open')
  });
  
  $('.board-button').click(function(){
    $('.board-menu').toggle('.board-list');
  });
  
}

$(document).ready(main)