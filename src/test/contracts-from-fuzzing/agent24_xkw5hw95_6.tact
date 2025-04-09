contract Receiver {
    // This contract always fails upon receiving a message, to force a bounce
    receive() {
        // Force failure so that the message bounces back to sender
        require(false, "Forced failure to bounce back message");
    }
}

contract Sender {
    // Function to send an internal message to Receiver with bounce enabled
    fun sendMsg(target: Address) {
        send(SendParameters{
            to: target,
            value: ton("1"),
            bounce: true,
            body: "Test message".asComment()
        });
    }

    // Bounced receiver: handles the bounced message from Receiver using raw type
    bounced(raw: Slice) {
        // For testing, simply accept the bounced message without further processing
    }
}
