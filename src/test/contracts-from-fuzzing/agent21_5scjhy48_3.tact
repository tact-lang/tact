contract SimpleContract {
    receive() {}
}

contract Test {
    receive() {
        // Correct usage of initOf with empty parentheses
        let pkg = initOf SimpleContract();
        // Correct usage of codeOf (should not need parentheses)
        let code = codeOf SimpleContract;
    }
}
