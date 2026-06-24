message MsgPing {
    flag: Bool;
}

contract ContractB {
    // This receive always fails to trigger a bounce
    receive() {
        require(false, "simulate failure");
    }
}

contract ContractA {
    target: Address;

    // ContractA constructor takes the address of ContractB
    init(target: Address) {
        self.target = target;
    }

    receive() {
        // Forward a message to ContractB with bounce enabled
        // Using self.forward with bounce = true and a comment as body
        self.forward(self.target, "ping".asComment(), true, null);
    }

    bounced(msg: bounced<MsgPing>) {
        // Handle bounced message by resetting a dummy state variable
        // Since MsgPing only contains a Bool field that occupies minimal space,
        // it's valid in bounced messages with 224-bit limitation
        let dummy: Int = msg.flag ? 1 : 0;
    }
}
