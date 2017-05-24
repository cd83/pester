Describe 'BeforeAfter Demo' {
    BeforeAll {
        Write-Host 'in the BeforeAll block'
        Add-Content -Path TestDrive:\foofile.txt -Value 'foo'
        Add-Content -Path TestDrive:\nofoofile.txt -Value 'not here'
    }

    AfterAll {
        Write-Host 'in the AfterAll block'
    }

    BeforeEach {
        Write-Host 'in the BeforeEach block'
    }

    AfterEach {
        Write-Host 'in the AfterEach block'
    }

    it 'should be true' {
        $true | should be $true
    }

    it 'should be false' {
        $false | should be $false
    }
}