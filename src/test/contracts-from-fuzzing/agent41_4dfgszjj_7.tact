contract BounceReceiver {
    // This contract is designed to fail its receive function to force a bounce
    receive() {
        require(false, "Force bounce");
    }
}

contract BounceSender {
    flag: Int;

    init() {
        self.flag = 0;
    }

    fun triggerBounce(addr: Address) {
        send(SendParameters {
            to: addr,
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Ping".asComment(),
            bounce: true
        });
    }

    // bounced receiver handling a typed bounced message
    bounced(msg: bounced<MyBounceMsg>) {
        self.flag = 1;
    }
}

message MyBounceMsg {
    dummy: Int;
}
