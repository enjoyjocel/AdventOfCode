$list = gc "C:\Users\enjoy\OneDrive\Misc_Shared\PSScripts\AdventOfCode\Day_2_Input.txt"

$list = $list -split "\n" -replace "\t" -replace "\s" 

$2count = 0
$3count = 0


foreach($ent in $list){

    $currList = @{}

    [char[]]$ent | % {$currList["$_"] += 1}

    $2s = $currList.Keys | ? {$currList["$_"] -eq 2}
    $3s = $currList.Keys | ? {$currList["$_"] -eq 3}

    if($2s){

        $2count++
    
    }

   if($3s){

        $3count++
    
    }
}

$z = $2count * $3count

Write-Output $z



