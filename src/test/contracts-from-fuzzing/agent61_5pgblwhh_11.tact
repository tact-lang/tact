// Test 4: Using wildcard as a local variable (discard) without accessing it (valid usage)

contract Test {
    receive() {
        let _ = 10;
        // No further reference to the wildcard variable; valid discard usage
    }
}
