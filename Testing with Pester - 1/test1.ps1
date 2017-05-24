Describe 'MVA Tests' {
    it '$true should be $true' {
        $true | should be $true
    }
}

describe 'VMA Tests' {
    
    context 'arithmetic' {
        
        it '1 + 1 should be 2' {
            1 + 1 | should be 2
        }

        it '2 * 3 should be 6' {
            2 * 3 | should be 6
        }
    }

    context 'string matching' {
        
        it 'an i should not be in team - like assertion' {
            'team' | should not belike '*i*'
        }

        it 'an i should not be in team - match assertion' {
            'team' | should not match 'i'
        }
    }

    context 'AAA approach' {
        $stringToTest = 'team'

        it 'an i should not be in team - like assertion' {
            $stringToTest | should not belike '*i*'
        }

        it 'an i should not be in team - like assertion' {
            $stringToTest | should not belike '*i*'
        }

        it 'an i should not be in team - match assertion' {
            $stringToTest | should not match 'i'
        }
    }
}