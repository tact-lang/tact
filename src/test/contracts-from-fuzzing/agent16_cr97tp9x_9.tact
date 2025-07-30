message BounceMsg {
    info: String;
}

contract ContractA {
    // Bounce receiver handles bounced messages which are wrapped in bounced<BounceMsg>
    bounced(msg: bounced<BounceMsg>) {
        // For testing, we do nothing here
    }

    receive() {
        // Valid Address literal: 0:<64 hex digits>
        let recipient: Address = address("0:1111111111111111111111111111111111111111111111111111111111111111");
        // Send a message with bounce enabled
        self.forward(recipient, "Message for bounce test".asComment(), true, null);
    }
}
