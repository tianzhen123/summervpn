
var cordova = require('cordova');
	var args={
		url : "",
		username : "",
	}
	
		connectVPN(args,successCallback,errorCallback);

module.exports = {



	connectVPN:function(args,successCallback, errorCallback){
		cordova.exec(successCallback, errorCallback, "SummerVpn", "connectVPN",[args])
	}
};

function successCallback(){

}
function errorCallback(){

}