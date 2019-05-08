$nums = gc .\Day_1_Input.txt



$nums = $nums -split "\n" -replace "\t" -replace "\s" 

[Int]$MainNum = 0 

[Array]$CurrFreq = @()

[Int]$reach = 0

$round = 1
while($reach -eq 0){


    foreach($num in $nums) {

        
        [INT]$Holder = $num
        $MainNum += $Holder

        $CurrFreq += $MainNum

    }

    $FirstDup = 
    $CurrFreq  | % {$s = new-object 'System.Collections.Generic.HashSet[string]'} {if (-not $s.Add($_)) {$_}} | select -First 1
    
    if($res){
        $reach = $FirstDup
    }


}

 $reach

 (0..($CurrFreq.Count-1)) | where {$CurrFreq[$_] -eq '66105'}