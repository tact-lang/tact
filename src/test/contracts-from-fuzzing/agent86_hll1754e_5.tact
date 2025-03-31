// Test 1: Valid usage of wildcard in a receiver parameter
message(42) UniverseCalls {}

contract Test {
    receive(_: UniverseCalls) {
        // Valid: underscore discards the parameter
    }
}
