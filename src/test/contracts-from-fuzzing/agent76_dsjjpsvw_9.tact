message UniverseCalls {
    // Dummy field to ensure proper structure
    id: Int;
}

contract Test {
    // Test 8: Receiver function using underscore to discard parameter
    // This should compile and discard the parameter value.
    receive(_: UniverseCalls) {
        // No operation
    }
}
