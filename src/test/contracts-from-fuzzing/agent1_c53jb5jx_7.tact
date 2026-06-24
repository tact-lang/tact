// Test receiving a string message
contract TextReceiver {
    lastMessage: String?;

    init() {
        self.lastMessage = null;
    }

    receive(msg: String) { // Receive a raw string
        self.lastMessage = msg;
    }
}