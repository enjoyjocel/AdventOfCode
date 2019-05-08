$list = gc "C:\Users\enjoy\OneDrive\Misc_Shared\PSScripts\AdventOfCode\Day_2_Input.txt"


$list = $list -split "\n" -replace "\t" -replace "\s" 


function String-Compare($string1,$string2){
    
    $stringplace = @{}

    for($i=0;$i -le $string1.length;$i++){

        if($string1[$i] -ne $string2[$i]){
        
            $stringplace.Add($i,1)
            
        }

    }

    $word = $string1

    foreach($let in ($stringplace.GetEnumerator() | select -ExpandProperty name)) {

        $word = $word.remove($let,1).insert($let,"!")
        
    }

    $word = $word -replace "!","" 

    Write-Output $word
    
}

$results = @{}

foreach($ent in $list){

    $list | ? {$_ -ne $ent} | % {
        
        try{

                $results.Add((String-Compare -string1 $ent -string2 $_),1)

            } 
        catch{
        
        }
    }
}

#
$results.GetEnumerator() | Sort-Object { $_.name.length }| select -Last 1


