message Msg { data: Int; }

// Contract A: simulates sending a message that will bounce
contract A {
    // Bounce receiver that handles bounced typed messages
    bounced(msg: bounced<Msg>) {
        // Minimal processing of the bounced message
    }
    
    // Receiver function to trigger sending a message
    receive() {
        // Send a message to a non-existent address to force a bounce
        // Use a dummy invalid address literal with 64 hex characters
        send(SendParameters{
            to: address("0:0000000000000000000000000000000000000000000000000000000000000000"),
            value: 10,
            bounce: true,
            mode: 0,
            body: Msg{ data: 99 }.toCell()
        });
    }
}
