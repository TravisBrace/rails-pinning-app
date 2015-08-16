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

}

$(document).ready(main)