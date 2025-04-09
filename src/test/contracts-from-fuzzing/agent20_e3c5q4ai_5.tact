message MyMsg1 {
    flag: Bool; // small field that likely fits within 224 bits
}

contract DoubleBounce {
    bounced(msg: bounced<MyMsg1>) {
        // Handle bounced message of type MyMsg1
        self.reply("Bounced MyMsg1 received".asComment());
    }

    bounced(raw: Slice) {
        // Fallback handler for all bounced messages
        self.reply("Fallback bounce received".asComment());
    }
}
