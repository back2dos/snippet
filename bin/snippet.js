(function (console) { "use strict";
var Main = function() { };
Main.main = function() {
	CanHasTehCodes.w3cSchoolsGoogleMaps("mapDemo",48.8567,2.3508);
};
var CanHasTehCodes = function() { };
CanHasTehCodes.w3cSchoolsGoogleMaps = function(targetId,lat,lng) {
	return (function () { function initialize() {
	var mapProp = {
		center: new google.maps.LatLng(lat,lng),
		zoom: 5,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var map=new google.maps.Map(document.getElementById(targetId),mapProp);
}
google.maps.event.addDomListener(window, 'load', initialize);; })();
};
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
