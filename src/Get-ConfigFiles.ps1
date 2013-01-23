function Get-ConfigFiles ($path) {
		$r = @() # ensure IEnumerable
		$configs = Get-ChildItem -Recurse -Filter *.config $path

		if ($configs) {
			$r = $configs
		}
		
		return ,$r # Force an IEnumerable
    }
