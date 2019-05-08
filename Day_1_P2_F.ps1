$nums = gc .\Day_1_Input.txt

$nums = $nums -split "\n" -replace "\t" -replace "\s" 

[Int]$MainNum = 0 

$CurrFreq = @{}

$reach = 0

while($reach -eq 0){


    foreach($num in $nums) {

        [INT]$Holder = $num
        $MainNum += $Holder

        try {

            $CurrFreq.Add($MainNum,1)

        }

        catch{

            $reach = $MainNum
            break

        }


    }

}
$reach
