// Test 2: Bounce receiver with raw Slice parameter
contract BounceRaw {
    bounced(msg: Slice) {
        // This bounce receiver accepts any raw bounced message
    }

    receive() {
        // Initiate a bounce by replying
        self.reply("Raw bounce".asComment());
    }
}
