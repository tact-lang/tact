message(42) UniverseCalls {}

contract Test {
    // Test receiver using underscore to discard the parameter
    receive(_: UniverseCalls) {
        // Received UniverseCalls message with opcode 42
    }

    // Provide an empty receiver to allow contract compilation
    receive() {}
}
