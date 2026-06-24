message MyMsg {
    value: Int;
}

contract Test {
    // Test 19: Bounced message receiver with proper bounced message type
    bounced(msg: bounced<MyMsg>) {
        // handling bounced messages
    }

    receive() {
        // empty receiver
    }
}
