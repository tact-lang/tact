contract Test {
    // Test 5: Using '_' as a variable name in a local scope should be rejected
    receive() {
        let _ = 123;
    }
}
