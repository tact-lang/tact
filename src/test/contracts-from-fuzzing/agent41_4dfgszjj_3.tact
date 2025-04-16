contract FailingReceiver {
    receive() {
        require(false, "Failing Receiver");
    }
}

contract BounceSender {
    recovery: Int;
    
    init() {
        self.recovery = 0;
    }
    
    // Changed to a proper function definition using 'fun'
    fun sendMessage(addr: Address) {
        send(SendParameters {
            to: addr,
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Test".asComment(),
            bounce: true
        });
    }
    
    bounced(msg: bounced<FallbackMsg>) {
        self.recovery = 1;
    }
}

message FallbackMsg {
    dummy: Int;
}
