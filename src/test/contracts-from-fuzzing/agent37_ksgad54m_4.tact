message MyMessage { val: Int as uint16 }

contract BounceTestDouble {
    someValue: Int = 0;

    bounced(raw: Slice) {
        // This bounce receiver for raw messages
        self.someValue = 1;
    }

    bounced(msg: bounced<MyMessage>) {
        // This bounce receiver for typed messages
        self.someValue = msg.val;
    }

    receive() {
        self.reply("OK".asComment());
    }
}
