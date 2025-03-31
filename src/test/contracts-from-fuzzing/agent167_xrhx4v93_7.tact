contract Test1 {
    // Receiver for empty message
    receive() {
        // Test: empty message should be caught by this receiver
        let a = 1;
    }
}


contract Test2 {
    // Receiver for specific text comment
    receive("hello") {
        // Test: specific comment receiver for the literal "hello"
        let b = 2;
    }
}


contract Test3 {
    // Receiver for arbitrary text message
    receive(str: String) {
        // Test: arbitrary text message should be caught here
        let c = 3;
    }
}


message MyMessage {
    value: Int;
}

contract Test4 {
    // Receiver for typed binary message
    receive(msg: MyMessage) {
        // Test: typed binary message receiver
        let x = msg.value;
    }
}


contract Test5 {
    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Test: fallback receiver should catch messages not matching other patterns
        let dummy = 0;
    }
}


message UniverseCalls {}

contract Test6 {
    // Receiver with underscore discard parameter
    receive(_: UniverseCalls) {
        // Test: parameter ignored via underscore
        let a = 1;
    }
}
