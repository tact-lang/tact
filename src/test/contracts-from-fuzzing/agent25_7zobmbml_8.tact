message MyMessage {
    x: Int;
}

// Test: BounceState - verify state modifications in bounced receiver
contract BounceState {
    // persistent state variable
    counter: Int = 0;

    // bounced receiver with typed bounce message
    bounced(msg: bounced<MyMessage>) {
        // Increase counter on bounce
        self.counter = self.counter + 1;
        // Optionally, reply with a comment
        self.reply("State updated on bounce".asComment());
    }

    // receive trigger to simulate sending a bounceable message
    receive("trigger") {
        // Send a message to self that is bounceable; if bounce occurs, bounced() will be triggered
        send(SendParameters{
            to: myAddress(),
            value: 0,
            bounce: true,
            body: MyMessage{ x: 999 }.toCell()
        });
    }
}
