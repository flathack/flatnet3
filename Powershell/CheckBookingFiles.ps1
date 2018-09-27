<#

.SYNOPSIS
    Filtert Umsätze und ordnet diese zu.

#>

function makeFile {
    # Inhalt der CSV einlesen:
    $content = Get-Content -Path $_.FullName | ConvertFrom-Csv -Delimiter ";"

    # Inhalt verarbeiten:
    $i = 0

    $sumSteven = 0

    # Objekt Bauen:
    $object = $content | ForEach-Object {
        
        $owner = "--"
        $kat = "--"
        # Stevens Buchungen:
        if(($_."Umsatz/Ort" -LIKE "*elan*") `
        -OR ($_."Umsatz/Ort" -LIKE "*shell*")`
        -OR ($_."Umsatz/Ort" -LIKE "*total*")`
        -OR ($_."Umsatz/Ort" -LIKE "*apple*")`
        -OR ($_."Umsatz/Ort" -LIKE "*avex*")`
        -OR ($_."Umsatz/Ort" -LIKE "*esso*")`
        -OR ($_."Umsatz/Ort" -LIKE "*JET-TANKSTELLE*")`
        -OR ($_."Umsatz/Ort" -LIKE "*SB-TANK*")`
        -OR ($_."Umsatz/Ort" -LIKE "*itunes*")`
        -OR ($_."Umsatz/Ort" -LIKE "*amazon Punkte*")`
        -OR ($_."Umsatz/Ort" -LIKE "*GOOGLE*")`
        -OR ($_."Umsatz/Ort" -LIKE "*paperspace*")`
        -OR ($_."Umsatz/Ort" -LIKE "*auslandseinsatzentgelt*")`
        ) {
            $owner = "Steven"
            
            #$sumSteven = [decimal]$_."Betrag in EUR" / 100 + $sumSteven
        }

        # HAUSHALTS OWNER:
        if(($_."Umsatz/Ort" -LIKE "*takeaway*") `
        ) {
            $owner = "Haushalt"
            
            #$sumSteven = [decimal]$_."Betrag in EUR" / 100 + $sumSteven
        }
        
        # Forderung oder Gutschrift
        if((([decimal]$_."Betrag in EUR" / 100) -lt 0) `
        ) {
            $art = "--"
            
        } else {
            $art = "Gutschrift"
        }

        # Kategorien:
        if(($_."Umsatz/Ort" -LIKE "*Amazon*") `
        -OR ($_."Umsatz/Ort" -LIKE "*AMZ*") `
        ) {
            $kat = "Amazon"
            
        }

        if(($_."Umsatz/Ort" -LIKE "*Paypal*") `
        ) {
            $kat = "Paypal"
        }


        if($owner -ne "Steven") {
            [PSCustomObject]@{
                Index = $i;
                Kaufdat = $_.Kaufdatum;
                Name = $_."Umsatz/Ort";
                Betrag = [decimal]$_."Betrag in EUR" / 100;
                Kategorie = $kat;
                Owner = $owner;
                Art = $art;
            }
        }

        $i++
    }

    $object | Format-Table | Out-File -FilePath ".\$($_.Name).result.txt"
}

Get-ChildItem -Path ".\sources" | Where-Object -Property Extension -EQ ".csv" | ForEach-Object {
if((Test-Path -Path ".\$($_.Name).result.txt") -eq $true) {
    Write-Host "Verarbeite : $($_.Name) existiert noch nicht" -ForegroundColor Yellow
    makeFile
} else {
    Write-Host "Verarbeite : $($_.Name) existiert noch nicht" -ForegroundColor Yellow
    makeFile

}

}