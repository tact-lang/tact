// Test: Block Statement with optional semicolon in last statement
contract TestContract {
    receive() {
        {
            dump(2)
        } // Block ends without semicolon for the last statement
    }
}
