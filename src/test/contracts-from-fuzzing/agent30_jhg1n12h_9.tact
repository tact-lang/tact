message EmptyMsg {}

contract Receiver {
    // This contract intentionally does not implement a receive function to accept EmptyMsg,
    // so messages sent to it with bounce: true will bounce back.
}

contract Sender {
    receiver: Address;
    bouncedReceived: Bool;

    init(receiver: Address) {
        self.receiver = receiver;
        self.bouncedReceived = false;
    }

    // Sends an outbound message with bounce: true to the designated Receiver
    receive("send") {
        self.forward(self.receiver, EmptyMsg{}.toCell(), true, null);
    }

    // Bounce receiver: triggered when the outbound message bounces back
    bounced(msg: bounced<EmptyMsg>) {
        self.bouncedReceived = true;
    }
}
