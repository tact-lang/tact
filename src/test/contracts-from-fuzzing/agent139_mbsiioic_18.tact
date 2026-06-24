message MyMsg {
    a: Int;
}

contract Test {
    // Test: Valid bounced receiver with typed message using bounced<MyMsg>
    bounced(msg: bounced<MyMsg>) {
        // Body intentionally empty
    }
}
