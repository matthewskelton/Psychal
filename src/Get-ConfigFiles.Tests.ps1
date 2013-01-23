$here = Split-Path -Parent $MyInvocation.MyCommand.Path
    $sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
    . "$here\$sut"

    Describe "Ensure-NoMatchesFoundForEmptyDir" {

		## Setup -File "$TestDrive\test.txt" "test"
	
        It "returns an empty list for no config files but some other files" {
			$result = Get-ConfigFiles "E:\Downloads\139518\config\none" # "TestDrive:\"
			$result.Should.Have_Count_Of(0) 
        }
		
    }
	Describe "Ensure-SingleMatchForSingleFile" {
		
		# Setup -File "$TestDrive\test1.txt" "test1"
	
			It "returns a one-item list for a single config file" {
			$result = Get-ConfigFiles "E:\Downloads\139518\config" # "TestDrive:\"
			$result.Should.Have_Count_Of(1) 
		}
    }
	Describe "Ensure-MatchesForSingleFilesInSubfolders" {
		
		# Setup -File "$TestDrive\test1.txt" "test1"
	
			It "returns a two-item list for a single config file in parent and subfolders" {
			$result = Get-ConfigFiles "E:\Downloads\139518\config2" # "TestDrive:\"
			$result.Should.Have_Count_Of(2) 
		}
	}
	
