contract Test {
    // Test 3 revised: Arbitrary text message receiver using proper variable declaration
    receive(str: String) {
        let s = str; // use the parameter to ensure it's compiled
    }
}
