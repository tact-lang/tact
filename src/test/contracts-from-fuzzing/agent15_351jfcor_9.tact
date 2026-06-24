message Ping {
    value: Int as coins;
}

contract BounceReceiver {
    // This receive function intentionally fails to trigger a bounce
    receive(ping: Ping) {
        require(false, "Failure in BounceReceiver");
    }
}

contract BounceSender {
    counter: Int;
    // Define a constant address using the address() function
    const receiverAddr: Address = address("0:1111111111111111111111111111111111111111111111111111111111111111");

    init() {
        self.counter = 0;
    }

    receive() {
        // Attempt to send a ping message to BounceReceiver with bounce flag true
        send(SendParameters{
            to: self.receiverAddr,
            value: ton("1"), 
            bounce: true,
            mode: SendRemainingValue, 
            body: Ping{value: ton("1")}.toCell()
        });
    }

    bounced(msg: bounced<Ping>) {
        // Upon receiving the bounced message, update the counter
        self.counter = msg.value;
    }
}
