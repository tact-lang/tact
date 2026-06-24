message MyMsg {
    a: Int;
}

contract Test {
    // Test: Bounced receiver with underscore discard for a typed bounced message
    bounced(_: bounced<MyMsg>) {
        // Body intentionally empty
    }
}
