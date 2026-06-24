// Test Case E: Underscore as a variable name (should be rejected)
contract Test {
    receive() {
        let _ : Int = 5;
    }
}
