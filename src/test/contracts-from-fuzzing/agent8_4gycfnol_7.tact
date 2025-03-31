message MyMsg {
    value: Int;
}

contract MixedBounce {
    // normal internal message receiver
    receive() {
        // Process normal messages
        // For this test, nothing is done
    }

    // bounce receiver for messages that bounce back
    bounced(msg: bounced<MyMsg>) {
        // Reset some state or log bounce occurrence
        // For testing, we simply ignore the bounced message
    }
}
