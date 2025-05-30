contract Test {
    // Test 3: Arbitrary text message receiver using parameter of type String
    receive(str: String) {
        // Use the text parameter for a dummy computation without variable declaration
        // Instead of 'var' use direct usage.
        if (str == "test") { /* dummy branch */ }
    }
}
