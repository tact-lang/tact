contract ReceiverFail {
    receive() {
        // This function intentionally fails to trigger a bounce
        require(false, "Forced failure to trigger bounce");
    }
}

contract SenderMultiBounce {
    // Bounce receiver that handles any bounced message as a raw Slice
    bounced(raw: Slice) {
        // In an actual scenario, the raw bounced message could be processed
    }
    
    // Function to send a message that is expected to bounce
    fun sendMsg(dest: Address) {
        // Sends a message with bounce flag true; message will trigger bounce in ReceiverFail
        self.forward(dest, "Bounce test".asComment(), true, null);
    }
}
