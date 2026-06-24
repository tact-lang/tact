contract BounceTestRaw {
    bounced(rawMsg: Slice) {
        // Just a raw receiver for bounced messages
        // For testing purposes, do nothing
    }

    receive() {
        self.reply("OK".asComment());
    }
}
