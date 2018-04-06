// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require bootstrap-sprockets
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

// added "require bootstrap" to enable hamburger menu in navbar
// removed "= require jquery_ujs" because it was causing two alert confirm boxes when coin is deleted (Jeremy says that jquery_ujs is required if I'm using jQuery but maybe I can leave it out as long as it's not breaking anything?)