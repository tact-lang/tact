message EmptyMsg {}

contract BounceFallback {
    value: Int;

    init() {
        self.value = 0;
    }

    // Send a bounceable message to the sender
    receive("trigger") {
        self.forward(sender(), EmptyMsg{}.toCell(), true, null);
    }

    // Fallback bounced receiver handling any bounced message as raw slice
    bounced(raw: Slice) {
        self.value = 42;
    }
}
