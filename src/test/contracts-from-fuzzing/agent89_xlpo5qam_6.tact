// Test 1: Valid usage in receiver parameter
message UniverseCalls {}

contract Test {
    // Valid: underscore as a discard parameter in receiver
    receive(_: UniverseCalls) {
        // Discarding the message parameter
    }
}
