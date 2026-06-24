/* Test Case 6: Using initOf on a contract with no parameters (valid) */

contract C {
    // No init function or parameters
    receive() {}
}

contract Test {
    receive() {
        let si = initOf C();
    }
}
