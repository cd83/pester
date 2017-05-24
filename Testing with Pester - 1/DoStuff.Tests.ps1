# Testing -CodeCoverage
# Invoke-Pester -Path .\DoStuff.Tests.ps1 -CodeCoverage .\DoStuff.ps1

. .\DoStuff.ps1

describe 'Get-Thing' {
    
    $result = Get-Thing

    it 'should return "I got the thing"' {
        $result | should be 'I got the thing'
    }
}

describe 'Do-Thing' {
    
    $result = Do-Thing

    it 'should return "I got the thing"' {
        $result | should be 'I got the thing' # will fail bc actual result is 'I did the thing'
    }
}

# describe 'Set-Thing' {
    
#     $result = Set-Thing

#     it 'should return "I got the thing"' {
#         $result | should be 'I got the thing' # will fail bc actual result is 'I set the thing'
#     }
# }