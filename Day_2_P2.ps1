$list = gc "C:\Users\enjoy\OneDrive\Misc_Shared\PSScripts\AdventOfCode\Day_2_Input.txt"

$list = $list -split "\n" -replace "\t" -replace "\s" 


function String-Compare($string1,$string2){
    
    $stringplace = @()

    for($i=0;$i -le $string1.length;$i++){

        if($string1[$i] -ne $string2[$i]){
        
            $stringplace += $i
            
        }

    }

    $word = $string1

    foreach($let in $stringplace) {

        $word = $word.remove($let,1).insert($let,"!")
        
    }

    $word = $word -replace "!","" 

    Write-Output $word
    
}

$results = @()

foreach($ent in $list){

    $list | ? {$_ -ne $ent} | % {
        
        $results += (String-Compare -string1 $ent -string2 $_)
    }
}

$results | Sort-Object { $_.length } | select -Last 5


