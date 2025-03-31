contract Test {
    // Test: using wildcard as variable name in local binding - expected to fail
    receive() {
       let _ = 1;
    }
}
