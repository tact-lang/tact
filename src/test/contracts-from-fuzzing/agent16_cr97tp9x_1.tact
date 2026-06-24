message MyMessage {
    value: Int;
}

contract BounceTest1 {
    // Valid bounced receiver using a typed bounced message
    bounced(msg: bounced<MyMessage>) {
        // In a real scenario, process the bounced message
        // For fuzzing purposes, we simply do nothing
    }

    // An example internal function that sends a reply, potentially causing a bounce
    receive() {
        // self.reply sends a bounceable message
        self.reply("Test bounce".asComment());
    }
}
