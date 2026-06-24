/* Test 6: Invalid usage - underscore as a local variable name */
contract Test {
    receive() {
        let _ = 5;
    }
}
