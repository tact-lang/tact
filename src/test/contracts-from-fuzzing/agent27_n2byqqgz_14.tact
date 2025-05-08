message MyMsg {
    x: Int;
}

contract SelfBounce {
    // Bounce receiver: triggered when a message sent to an invalid address bounces back
    bounced(msg: bounced<MyMsg>) {
        // Using self.reply to send a message back when bounce is detected
        self.reply("Bounce detected".asComment());
    }

    // Regular receiver that triggers sending a message
    receive() {
        // Send a message to an address that is known to be invalid (so it bounces)
        send(SendParameters{
            to: address("0:0000000000000000000000000000000000000000000000000000000000000000"),
            value: ton("1"),
            bounce: true,
            mode: 0,
            body: MyMsg { x: 42 }.toCell()
        });
    }
}
