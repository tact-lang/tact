message BM {
    // Empty payload to ensure it fits within 224 usable data bits
}

contract BounceValid {
    value: Int = 0;

    // Typed bounced message receiver for BM messages
    bounced(msg: bounced<BM>) {
        // Instead of reading any field, just assign a constant
        self.value = 42;
    }

    // Fallback bounced message receiver for any other bounced messages
    bounced(_raw: Slice) {
        self.value = 100;
    }

    // Function to send a bounceable message to a given address
    fun sendBounce(to: Address) {
        self.forward(to, BM{}.toCell(), true, null);
    }
}
