// Test 1: Valid usage of wildcard in a receiver parameter (discarding message)
message UniverseCalls {}

contract TestValidReceiver {
    // Using '_' as discard parameter is allowed in a receiver
    receive(_: UniverseCalls) {
         // Valid: the parameter is discarded
         // (its value is not accessible)
    }
}
