contract BounceTestRaw {
    // Bounce receiver with raw Slice for handling any bounced messages
    bounced(rawMsg: Slice) {
        // Just read the bounced raw message
    }

    // Standard function to send a message that might bounce
    receive() {
        // Attempt to reply with a bounced message
        self.reply("Hello, bounce!".asComment());
    }
}