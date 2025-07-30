message MyMsg {}
message AnotherMsg {}

contract DoubleBounce {
    bounced(msg: bounced<MyMsg>) {
        // Handle bounced message of type MyMsg
    }

    bounced(msg: bounced<AnotherMsg>) {
        // Handle bounced message of type AnotherMsg
    }

    receive() {
        // For testing, let's forward a MyMsg message to some dummy address
        self.forward(address("0:1111111111111111111111111111111111111111111111111111111111111111"), MyMsg{}.toCell(), true, null);
    }
}
