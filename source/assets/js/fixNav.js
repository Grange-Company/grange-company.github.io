navHandler = function(e) {
  var nav = document.querySelector('.fixed-nav');
  T.utils.addClass(nav, 'invisible');
};

onscroll = function () {
  var nav = document.querySelector('.fixed-nav');
  var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
  var threshold = 30;

  if (scrollTop > threshold) {
    console.log('yup');
    T.utils.addClass(nav, 'visible');
  } else {
    console.log('nope');
    T.utils.removeClass(nav, 'visible');
  }
};

navHandler();