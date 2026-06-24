// Test 1: Valid use as receiver parameter
message UniverseCalls {}

contract ValidReceiver {
    // Wildcard parameter in receiver: allowed when discarding value
    receive(_: UniverseCalls) {
        // just discarding the message
    }
}
