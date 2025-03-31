contract ReceiverOrderTest {
    // Receivers declared in reverse order compared to documented matching order
    receive(msg: Slice) {
        // Fallback receiver
    }

    receive(str: String) {
        // Arbitrary text receiver
    }

    receive("hello") {
        // Specific text comment receiver
    }

    receive() {
        // Empty message receiver
    }
}
