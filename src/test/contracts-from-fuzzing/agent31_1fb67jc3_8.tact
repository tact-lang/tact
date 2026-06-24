message MultiBounceMsg {
    counter: Int;
}

contract Sender {
    // In receive, Sender sends a bounceable message using self.reply
    receive() {
        // The message body is constructed from the MultiBounceMsg
        self.reply(MultiBounceMsg { counter: 42 }.toCell());
    }
    
    bounced(msg: bounced<MultiBounceMsg>) {
        // Bounce handler for Sender
        // In an actual scenario, this would be executed if the outgoing message bounces
    }
}

contract ReceiverWithoutHandler {
    // This contract intentionally does not implement a receive function.
    // Thus, any message sent to it will bounce.
    external("dummy") {}
}

contract BounceChain {
    counter: Int;

    init() {
        self.counter = 0;
    }

    bounced(msg: bounced<MultiBounceMsg>) {
        // On bounce, increment counter, simulating multi-level bounce handling
        self.counter = self.counter + 1;
        // Forward bounce reply using self.reply (bounce flag true by default)
        self.reply("BounceChain reply".asComment());
    }

    receive() {}
}
