message UniverseCalls {}

contract Test {
    // Test underscore parameter receiver: underscore means the parameter is unused
    receive(_: UniverseCalls) {
        // handler for UniverseCalls messages
    }
}
