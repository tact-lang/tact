message BouncedMsg {
    error: Int;
}

contract TestBounced {
    // Test: Bounced message receiver
    bounced(msg: bounced<BouncedMsg>) {
        // handle bounced message
    }
}
