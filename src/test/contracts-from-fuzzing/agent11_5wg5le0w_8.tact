contract Test {
    receive() {
         // Test: underscore as a variable name (should be rejected)
         let _ = 123;
    }
}
