message SampleMessage {
    a: Int;
}

contract Test {
    // Generic text receiver declared first
    receive(str: String) {
        // This should handle arbitrary text messages
    }

    // Specific text receiver declared second
    receive("test") {
        // This should handle messages with comment "test"
    }

    // Fallback receiver declared third
    receive(msg: Slice) {
        // Handle any binary message not matched by other receivers
    }

    // Empty receiver declared fourth
    receive() {
        // Handle empty messages
    }

    // Typed binary message receiver declared last
    receive(msg: SampleMessage) {
        let x = msg.a;
    }
}
