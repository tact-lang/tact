struct TuplePair { first: Int; second: Int }

contract AdvancedReturnFuzz {
    // This function tests a return with a trailing comment and no semicolon
    fun commentedReturn(): Int {
        return 123 // trailing comment, no semicolon at end of line
    }

    // This function returns from within a repeat loop nested inside a block
    fun nestedReturnInRepeat(x: Int): Int {
        repeat(3) {
            { // nested block within repeat
                if (x == 42) { return 99; }
            }
        }
        return x;
    }

    // Getter that returns a simple value
    get fun simpleGetter(): Int {
        return 456;
    }

    // This function tests using parentheses around a block-like structure without braces
    fun parenthesesReturn(x: Int): Int {
        return (x + 1);
    }
}
