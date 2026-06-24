contract Test {
    value: Int = 0;

    // Empty message receiver
    receive() {
        self.value = 1;
    }

    // Specific text receiver for "inc"
    receive("inc") {
        self.value += 1;
    }

    // Generic text receiver for any other text messages
    receive(str: String) {
        self.value = 999;
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        self.value = -1;
    }

    // External receiver for off-chain messages with a fixed comment
    external("reset") {
        self.value = 0;
    }
}
