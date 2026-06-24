message MyMessage {
    value: Int;
}

message AnotherMsg {}

contract Test {
    // 1. Empty message receiver for internal messages
    receive() {
        // Handle empty message
    }

    // 2. Specific text receiver for messages with comment "hello"
    receive("hello") {
        // Handle message with comment "hello"
    }

    // 3. Arbitrary text receiver for any text message that doesn't match specific texts
    receive(str: String) {
        // Handle arbitrary text messages
    }

    // 4. Typed binary message receiver for messages of type MyMessage
    receive(msg: MyMessage) {
        // Handle typed binary message
    }

    // 5. Fallback receiver for any binary message not matched above
    receive(msg: Slice) {
        // Handle fallback binary message
    }

    // 6. Typed message receiver with underscore to discard its parameter
    receive(_: AnotherMsg) {
        // Handle message of type AnotherMsg, parameter value is ignored
    }
}
