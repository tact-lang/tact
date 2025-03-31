message MyMessage { val: Int as uint16 }

contract BounceRecursiveCorrect {
    bounced(msg: bounced<MyMessage>) {
        if (msg.val > 0) {
            // Instead of using self.address, we use self.reply to respond back
            self.reply("Recursive bounce".asComment());
        }
    }

    receive() {
        self.reply("OK".asComment());
    }
}
