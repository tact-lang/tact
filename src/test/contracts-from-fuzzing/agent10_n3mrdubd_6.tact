message TestMsg {
    msg: String;
}

contract BounceReceiver {
    bounced(raw: Slice) {
        // Fallback bounced handler
    }
    
    receive("test") {
        // Intentionally left empty (simulate failure)
    }
}

contract BounceSender {
    bounced(msg: bounced<TestMsg>) {
        // Process bounced message for testing
    }
    
    fun sendTest(to: Address) {
        self.forward(to, TestMsg{msg: "Hello"}.toCell(), true, null);
    }
}
