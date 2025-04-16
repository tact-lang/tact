message MyMsg {
    value: Int;
}

contract ContractC {
    bounced(msg: bounced<MyMsg>) {
        // Terminal bounce handler in ContractC
    }
}

contract ContractB {
    bounced(msg: bounced<MyMsg>) {
        // Bounce receiver in ContractB: forward the bounced message back to the sender
        self.forward(sender(), null, true, null);
    }
}

contract Sender {
    fun sendMessage() {
        // Send a message with bounce enabled to ContractB
        self.forward(sender(), null, true, null);
    }
    bounced(msg: bounced<MyMsg>) {
        // Bounce receiver in Sender: handle bounced message
    }
}
