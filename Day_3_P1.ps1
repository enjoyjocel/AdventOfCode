$claims = gc "C:\Users\enjoy\OneDrive\Misc_Shared\PSScripts\AdventOfCode\Day_3_Input_Test.txt" 

$ClaimsArr = @()

$claims | % {

    $Rowinf = $_ -replace "#" -replace " @ ","," -replace ": ","," -replace "x","," -split ","

    $RowObjProp =  [Ordered]@{
        "id" = $Rowinf[0]
        "x" = [int]$Rowinf[1]
        "y" = [int]$Rowinf[2]
        "w" = [int]$Rowinf[3]
        "h" = [int]$Rowinf[4]
    }

    

    $ClaimsArr += New-Object -TypeName PSobject -Property $RowObjProp
}

$Grid = @{}

foreach($z in $ClaimsArr){

Write-Host "processing $($z.id)"

    for($x=$z.x + 1;$x -le ($z.x + $z.w);$x++){

        for($y=$z.y + 1;$y -le ($z.y + $z.h);$y++){
           
           [array]$grid["x$($x)y$($y)"] += $z.id
        
         }
    
    }

}


$overlappedGrids = ($Grid.GetEnumerator() | ? {($_.Value | Measure-Object | select -expand Count) -gt 1})

$uniquGrids = ($Grid.GetEnumerator() | ? {($_.Value | Measure-Object | select -expand Count) -eq 1}) 