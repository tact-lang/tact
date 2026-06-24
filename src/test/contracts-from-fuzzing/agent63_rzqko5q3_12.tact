contract Test {
    receive() {
        // Valid usage of wildcard in a local variable assignment for discarding the value
        let _ = 10;
    }
}
