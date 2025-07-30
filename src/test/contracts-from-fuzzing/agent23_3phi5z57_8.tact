message MyMessage {
    value: Int;
}

contract DualBounce {
    // First bounced receiver: typed bounce receiver
    bounced(msg: bounced<MyMessage>) {
        // Process typed bounced message: no state change, just a comment
    }

    // Second bounced receiver: fallback raw slice receiver
    bounced(msg: Slice) {
        // Fallback: process all bounced messages not matched by other receivers
    }

    receive() {
        // Trigger a bounce by replying
        self.reply("Dual bounce test".asComment());
    }
}
