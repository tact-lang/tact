message SampleMessage {
    a: Int;
}

contract Test {
    // Fallback receiver for unmatched binary message
    receive(msg: Slice) {
        // Fallback message handler
    }

    // Specific text receiver for message with comment "abc"
    receive("abc") {
        // Handle specific text message "abc"
    }

    // Generic text receiver for any arbitrary text message
    receive(str: String) {
        // Handle arbitrary text messages
    }

    // Empty receiver for empty messages
    receive() {
        // Handle empty messages
    }

    // Typed receiver for binary message of type SampleMessage
    receive(msg: SampleMessage) {
        let x = msg.a;
    }
}
