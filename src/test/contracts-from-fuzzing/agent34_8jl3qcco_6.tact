message FailMsg {}

contract ReceiverFail {
    // This contract always fails upon receiving a message, triggering a bounce
    receive() {
        require(false, "Forcing bounce");
    }
}

contract MultiBounce {
    failAddr: Address;
    bouncedReceived: Bool;

    init(failAddr: Address) {
        self.failAddr = failAddr;
        self.bouncedReceived = false;
    }

    // Bounce receiver handling bounced messages of type FailMsg
    bounced(msg: bounced<FailMsg>) {
        // Mark that a bounce was received
        self.bouncedReceived = true;
    }

    // In this function, we send a message to a contract that is expected to fail
    receive() {
        // Send a message of type FailMsg to the failing contract at address failAddr
        self.forward(self.failAddr, FailMsg{}.toCell(), true, null);
    }
}
