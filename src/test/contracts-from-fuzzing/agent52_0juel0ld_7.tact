message UniverseCalls {}

contract Test {
    // Test underscore usage to discard parameter
    receive(_: UniverseCalls) {
        // Implementation where the parameter is discarded
    }
}