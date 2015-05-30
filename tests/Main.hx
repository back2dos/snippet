package;

class Main {
	
	static function main() {
		CanHasTehCodes.w3cSchoolsGoogleMaps(
			'mapDemo', 
			48.8567, 
			2.3508
		);
	}
	
}

class CanHasTehCodes {
	@:snippet static public function w3cSchoolsGoogleMaps(targetId:String, lat:Float, lng:Float):Bool;
}