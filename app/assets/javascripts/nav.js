var main = function () {
  $('.left').mouseenter(function() {
    $('.left').toggleClass('left-open');
    $('ul').toggle('li');
    $('.right').toggleClass('right-open')
 });
  
  $('.left').mouseleave(function() {
    $('.left').toggleClass('left-open');
    $('ul').toggle('li');
    $('.right').toggleClass('right-open');
  });

}

$(document).ready(main)