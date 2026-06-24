message Msg {
    value: Int as coins;
}

contract FailContract {
    // This contract always fails when receiving a Msg, triggering bounce
    receive(msg: Msg) {
        require(false, "Intentional failure in FailContract");
    }
}

contract MultiBounce {
    counter: Int;
    // Constant address of the FailContract. We use a dummy address for testing purposes.
    const failAddr: Address = address("0:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    init() {
        self.counter = 0;
    }

    // Inbound message that starts the bounce chain
    receive() {
        send(SendParameters{
            to: self.failAddr,
            value: ton("1"),
            bounce: true,
            mode: SendRemainingValue,
            body: Msg{value: ton("1")}.toCell()
        });
    }

    // Bounce receiver: triggered when the message bounces back from FailContract
    bounced(msg: bounced<Msg>) {
        // Update counter with the bounced value
        self.counter = msg.value;
        // Send a new message to FailContract with an increased value, in an attempt to chain bounces
        send(SendParameters{
            to: self.failAddr,
            value: ton("1"),
            bounce: true,
            mode: SendRemainingValue,
            body: Msg{value: self.counter + ton("1")}.toCell()
        });
    }
}
