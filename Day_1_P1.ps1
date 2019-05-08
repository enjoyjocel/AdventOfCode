$nums = gc .\Day_1_Input.txt

$nums = $nums -split "\n" -replace "\t" -replace "\s" 

[Int]$MainNum = 0 

$nums | % {
    
    [INT]$Holder = $_
    $MainNum += $Holder
}

$MainNum
