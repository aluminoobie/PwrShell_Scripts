Function Get-FileHashOld
 {
     Param(
         [String]
         $FileName,
         [ValidateSet("MD5", "SHA1", "SHA256", "SHA384", "SHA512")]
         $HashAlgorithm = "MD5"
     )

     $FileStream = New-Object
 System.IO.FileStream($FileName,[System.IO.FileMode]::Open)
     $StringBuilder = New-Object System.Text.StringBuilder

 [System.Security.Cryptography.HashAlgorithm]::Create($HashAlgorithm).Compute
 Hash($FileStream)|%{[Void]$StringBuilder.Append($_.ToString("x2"))}
     $FileStream.Close()
     $StringBuilder.ToString()
 }