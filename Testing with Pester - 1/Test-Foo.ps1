## Ensure the function is available in the session
function Test-Foo {
    param(
        $FilePath
    )

    if (Select-String -Path $FilePath -Pattern 'foo') {
        $true
    } else {
        $false
    }
}

Describe 'Test-Foo' {
    
    # Arrange
    BeforeAll {
        Add-Content -Path TestDrive:\foofile.txt -Value 'foo'
        Add-Content -Path TestDrive:\nofoofile.txt -Value 'nothere'
    }

    # Act
    $foooutput = Test-Foo -FilePath TestDrive:\foofile.txt
    $nofoooutput = Test-Foo -FilePath TestDrive:\nofoofile.txt

    # Assert
    it 'when the file has "foo" in it, return true' {
        $foooutput | should be $true
        $foooutput | should beoftype 'bool'
        @($foooutput).Count | should be 1
    }

    it 'when the file has no "foo" in it, return false' {
        $nofoooutput | should be $false
    }

}