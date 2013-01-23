function Get-ConfigFiles ($path) {
		$r = @() # ensure IEnumerable
		$configs = Get-ChildItem -Recurse -Filter *.config $path
		Write-Host "configs:" $configs

		if ($configs) {
			if ($configs.Length > 1) {
					$r = $configs
				}
			else {
				$r = @($configs)
			}
		}
		
		Write-Host $r.GetType().FullName
		Write-Host "r.count: " $r.count
		Write-Host "r.length: " $r.length
		return ,$r # Force an IEnumerable
    }
