message UniverseCalls {}

contract Test {
    // Test 7: Receiver with underscore to discard the parameter
    receive(_: UniverseCalls) {
        // Parameter is discarded, no operation
    }
}
