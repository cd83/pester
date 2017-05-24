describe 'TestDrive Demo' {

    BeforeAll {
        Add-Content -path TestDrive:\testfile.txt -Value 'testfile'
    }

    AfterAll {
        Write-Host (Get-Content -Path TestDrive:\testfile.txt)
    }

    it 'TestDrive should exist' {
        'TestDrive:\' | should exist
    }

    it 'the file we created in the TestDrive should exist' {
        'TestDrive:\testfile.txt' | should exist
    }
}