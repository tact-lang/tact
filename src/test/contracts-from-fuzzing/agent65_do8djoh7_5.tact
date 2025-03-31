// Test 1: Valid use of wildcard in receiver parameter

message UniverseCalls {}

contract Test1 {
    // The underscore in the parameter signals it is unused/discarded
    receive(_: UniverseCalls) {
        // No usage required, correct usage as per docs
    }
}
