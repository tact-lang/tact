// Receiver function fuzz-testing cycle for Tact
//
// Test 1: Empty message receiver
contract Test1 {
    receive() {
        // Handler for empty messages
    }
}

// Test 2: Specific text comment receiver
contract Test2 {
    receive("text") {
        // Handler for a specific text comment message
    }
}

// Test 3: Arbitrary text message receiver
contract Test3 {
    receive(str: String) {
        // Handler for arbitrary text messages
    }
}

// Test 4: Typed binary message receiver
message MyMessage {
    value: Int;
}

contract Test4 {
    receive(msg: MyMessage) {
        // Handler for binary message of type MyMessage
    }
}

// Test 5: Fallback receiver for unmatched binary messages
contract Test5 {
    receive(msg: Slice) {
        // Fallback for unmatched binary messages
    }
}

// Test 6: Duplicate empty message receivers - should fail compilation
contract Test6 {
    receive() {
        // First empty message handler
    }
    // Uncommenting the following receiver will cause a compilation error
    // receive() {
    //     // Second empty message receiver - duplicate
    // }
}

// Test 7: Receiver with underscore to discard parameter
message MyMsg {
    a: Int;
}

contract Test7 {
    receive(_: MyMsg) {
        // Typed binary receiver that discards incoming message value
    }
}

// Test 8: Overlapping text receivers - specific then arbitrary
contract Test8 {
    receive("increment") {
        // This receiver handles messages with the specific text "increment"
    }
    receive(str: String) {
        // This receiver handles arbitrary text messages not matched by specific text
    }
}

// Test 9: Invalid receiver parameter type (should fail)
contract TestInvalidA {
    // This should not compile because Int is not an accepted type for a receiver
    // Valid types are: message types, Slice, or String
    // Uncomment to test failure:
    // receive(msg: Int) {
    //     
    // }
}

// End of Receiver Function Tests
