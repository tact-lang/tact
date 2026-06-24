contract ContractA {
    flag: Int;

    init() {
        self.flag = 0;
    }

    // Bounce receiver in ContractA: increments flag and sends a bouncing message back to sender
    bounced(msg: bounced<BMsg>) {
        self.flag = self.flag + 1;
        // Send bounce message back to the sender (which is ContractB in this scenario)
        send(SendParameters {
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: "Recursion from A".asComment(),
            bounce: true
        });
    }

    // A simple receive to initiate bounce chain
    receive() {
        // Do nothing
    }
}

contract ContractB {
    flag: Int;

    init() {
        self.flag = 0;
    }

    // Bounce receiver in ContractB: increments flag and bounces back message
    bounced(msg: bounced<BMsg>) {
        self.flag = self.flag + 2;
        // Bounce message back to sender (which is ContractA)
        send(SendParameters {
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: "Recursion from B".asComment(),
            bounce: true
        });
    }

    // A simple receive to initiate bounce chain
    receive() {
        // Do nothing
    }
}

message BMsg {
    dummy: Int;
}
