message MyMessage {
    counter: Int;
}

contract BounceTest {
    // Bounce receiver that accepts a typed bounced message
    bounced(msg: bounced<MyMessage>) {
        // In a typical contract, you might process the bounced message and restore state
        // For our test we simply do nothing to validate that the definition compiles
    }

    // A regular receive function to initiate bounce if needed (not strictly part of the bounce receiver test)
    receive() {
        // Trigger a reply-caused bounce (using self.reply for example)
        self.reply("Test bounce".asComment());
    }
}
