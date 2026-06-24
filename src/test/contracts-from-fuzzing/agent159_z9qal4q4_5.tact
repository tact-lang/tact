contract Test {
    // Test 3: Parameterized string receiver with no usage of the parameter (to avoid potential syntax issues).
    receive(str: String) {
        // receiver body intentionally left empty
    }
}
