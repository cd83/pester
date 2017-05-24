function Start-ClusterTest {
    param($ClusterName)

    Write-Host 'Doing the thing...'
    Write-Output "I did the thing against $ClusterName!"
}

## Test with no mocking
# Describe 'Start-ClusterTest' {
#     $result = Start-ClusterTest -ClusterName 'SERVER1'

#     it 'returns a string with $ClusterName inside' {
#         ## I know the input and output together. It's 'SERVER1'
#         $result | should be 'I did the thing against SERVER1!'
#     }
# }

## Test with mocking
Describe 'Start-ClusterTest' {
    mock -CommandName 'Write-Output' -MockWith {
        'describemock'
    }

    $result = Start-ClusterTest -ClusterName 'SERVER1'

    it 'returns a string with $ClusterName inside' {
        ## I know the input and output together. It's 'SERVER1'
        $result | should be 'describemock'
    }

    context 'MockScope1' {
        mock -CommandName 'Write-Output' -MockWith {
            'MockScope1'
        }

        $result = Start-ClusterTest -ClusterName 'SERVER1'

        # this will succeed because the mock right above applies instead of describemock
        it 'does the thing int he mock scope 1 context' {
            $result | should be 'MockScope1'
        }

        # this will fail because we're not in describemock any more
        it 'does the thing int he mock scope 1 context' {
            $result | should be 'describemock'
        }
    }

    context 'MockScope2' {
        mock -CommandName 'Write-Output' -MockWith {
            'MockScope2'
        }

        $result = Start-ClusterTest -ClusterName 'SERVER1'

        # will fail
        it 'does the thing int he mock scope 1 context' {
            $result | should be 'MockScope1'
        }

        # this should pass bc we're in MockScope2 context
        it 'does the thing int he mock scope 2 context' {
            $result | should be 'MockScope2'
        }

        # will fail
        it 'does the thing int he mock scope 1 context' {
            $result | should be 'describemock'
        }
    }

    it 'does the thing int he describe block' {
        $result | should be 'describemock'
    }
}