message UniverseCalls {}

contract Test {
    // Test 6: Using underscore to discard receiver parameter
    receive(_: UniverseCalls) {
        // Handle message, parameter discarded
    }
}