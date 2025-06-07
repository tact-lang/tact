message MyBounce8 {
    v: Int as uint8; // constrained to 8-bit unsigned integer, well within 224 bits
}

contract BounceChain8 {
    // Bounce receiver for MyBounce8 messages
    bounced(msg: bounced<MyBounce8>) {
        // Echo the bounced message by replying with a modified version
        self.reply(MyBounce8{ v: msg.v + 1 }.toCell());
    }
    
    // Standard receive function to trigger sending a bounceable message
    receive() {
        // Send a message to self that will bounce (for testing, we assume sender() is used for simplicity)
        send(SendParameters{
            to: sender(),
            value: ton("0.02"),
            bounce: true,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: MyBounce8{ v: 42 }.toCell(),
        });
    }
}
