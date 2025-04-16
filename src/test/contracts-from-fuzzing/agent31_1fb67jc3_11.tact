message MyMessage {
    value: Int;
}

contract BounceState {
    counter: Int;

    init() {
        self.counter = 0;
    }

    bounced(msg: bounced<MyMessage>) {
        self.counter = self.counter + 1;
        // Calling self.reply in bounce receiver
        self.reply("Bounce reply".asComment());
    }

    receive() {}
}
